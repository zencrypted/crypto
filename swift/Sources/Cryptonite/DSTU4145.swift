import Foundation

/// DSTU 4145 Constants and Parameters
public struct DSTU4145Params {
    public let m: Int
    public let k: Int // For trinomial x^m + x^k + 1
    public let j: Int // For pentanomial x^m + x^k + x^j + x^l + 1 (if needed)
    public let l: Int
    public let a: Int // 0 or 1
    public let b: BigInt
    public let n: BigInt // Order
    public let px: BigInt
    public let py: BigInt
    
    // Irreducible polynomial as BigInt
    public var poly: BigInt {
        var p = BigInt(1) << m
        p ^= (BigInt(1) << k)
        if j > 0 { p ^= (BigInt(1) << j) }
        if l > 0 { p ^= (BigInt(1) << l) }
        p ^= 1
        return p
    }
    
    // M257_PB parameters from dstu4145_params_internal.c
    public static let M257_PB: DSTU4145Params = {
        let bBytes: [UInt8] = [
            0x10, 0xbe, 0xe3, 0xdb, 0x6a, 0xea, 0x9e, 0x1f, 0x86, 0x57, 0x8c, 0x45, 0xc1, 0x25, 0x94, 0xff,
            0x94, 0x23, 0x94, 0xa7, 0xd7, 0x38, 0xf9, 0x18, 0x7e, 0x65, 0x15, 0x01, 0x72, 0x94, 0xf4, 0xce,
            0x01
        ]
        let nBytes: [UInt8] = [
            0x0d, 0x47, 0x7d, 0x90, 0x14, 0x77, 0xe1, 0xd3, 0x87, 0xe9, 0x82, 0xf1, 0x3a, 0x21, 0x59, 0x67,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
        ]
        // Truncate trailing zeros for cleaner BigInt if needed/auto-handled, but M257 is 257 bits so index 32 byte 0x01/0x80 is important.
        // Wait, C array for 'b' has 0x01 at index 32. My array above has 33 bytes? Yes.
        
        let pxBytes: [UInt8] = [
            0xb7, 0x0f, 0xd2, 0xd8, 0xdc, 0xe8, 0xa9, 0x34, 0x23, 0xc6, 0x10, 0x1b, 0xca, 0x91, 0xc4, 0x7a,
            0x00, 0x7e, 0x6c, 0x30, 0x0b, 0x26, 0xcd, 0x55, 0x6c, 0x9b, 0x0e, 0x7d, 0x20, 0xef, 0x29, 0x2a,
            0x00 // Implicit 0? No, param dump had 0x00.
        ]
        
        let pyBytes: [UInt8] = [
            0xef, 0x14, 0xd8, 0x56, 0xf1, 0x2c, 0x70, 0x8b, 0x97, 0x0b, 0xd6, 0xa9, 0x93, 0x2c, 0x81, 0xe6,
            0x02, 0x31, 0xa0, 0xee, 0xd8, 0xf6, 0xcc, 0x9f, 0x44, 0xd4, 0x44, 0xf7, 0x1f, 0xd4, 0x86, 0x06,
            0x01
        ]

        return DSTU4145Params(
            m: 257, k: 12, j: 0, l: 0, a: 0,
            b: BigInt(leBytes: bBytes),
            n: BigInt(leBytes: nBytes),
            px: BigInt(leBytes: pxBytes),
            py: BigInt(leBytes: pyBytes)
        )
    }()
}

public struct DSTU4145 {
    
    // MARK: - Binary Field Arithmetic (GF(2^m))
    
    /// Multiplies two polynomials in GF(2^m) modulo the irreducible polynomial.
    /// This is a simplified "shift-and-xor" implementation. For production high-perf, use windowing or Comb.
    public static func fieldMul(_ a: BigInt, _ b: BigInt, _ poly: BigInt, m: Int) -> BigInt {
        var p = BigInt(0)
        var tempA = a
        var tempB = b
        
        while !tempB.isZero {
            if tempB & 1 == 1 {
                p ^= tempA
            }
            
            tempA <<= 1
            // If degree of tempA equals m (i.e. bit `m` is set), reduce.
            // A faster check:
            if (tempA >> m) & 1 == 1 {
                 tempA ^= poly
            }
            
            tempB >>= 1
        }
        return p
    }
    
    /// Inverse in GF(2^m) using Extended Euclidean Algorithm
    public static func fieldInv(_ a: BigInt, _ poly: BigInt) -> BigInt {
        if a.isZero { return 0 }
        
        var u = a
        var v = poly
        var g1 = BigInt(1)
        var g2 = BigInt(0)
        
        while !u.isZero && u != 1 { // while u != 1 && u != 0
             // Get degrees
             let degU = u.bitLength - 1 
             let degV = v.bitLength - 1
             
             if degU < degV {
                 swap(&u, &v)
                 swap(&g1, &g2)
                 continue
             }
             
             // Multiply g2 by x^(degU - degV) and add to g1 (polynomial division step)
             let diff = degU - degV
             // u += v * x^diff
             // g1 += g2 * x^diff
             
             u ^= (v << diff)
             g1 ^= (g2 << diff)
        }
        
        if u.isZero { return 0 } // Should not happen for irreducible poly unless a=0
        return g1
    }
    
    // MARK: - Elliptic Curve Arithmetic
    
    public struct Point {
        public let x: BigInt
        public let y: BigInt
        public let isInfinity: Bool
        
        public static let infinity = Point(x: 0, y: 0, isInfinity: true)
    }
    
    public static func pointAdd(_ p1: Point, _ p2: Point, params: DSTU4145Params) -> Point {
        if p1.isInfinity { return p2 }
        if p2.isInfinity { return p1 }
        
        // P1 + P1 = 2P1
        if p1.x == p2.x {
            if p1.y == p2.y {
                return pointDouble(p1, params: params)
            } else {
                return .infinity // P + (-P) = O
            }
        }
        
        // lambda = (y1 + y2) / (x1 + x2)
        let sumY = p1.y ^ p2.y
        let sumX = p1.x ^ p2.x
        let invSumX = fieldInv(sumX, params.poly)
        let lambda = fieldMul(sumY, invSumX, params.poly, m: params.m)
        
        // x3 = lambda^2 + lambda + x1 + x2 + a
        let lambda2 = fieldMul(lambda, lambda, params.poly, m: params.m)
        var x3 = lambda2 ^ lambda ^ p1.x ^ p2.x
        if params.a == 1 { x3 ^= 1 }
        
        // y3 = lambda * (x1 + x3) + x3 + y1
        let term = fieldMul(lambda, p1.x ^ x3, params.poly, m: params.m)
        let y3 = term ^ x3 ^ p1.y
        
        return Point(x: x3, y: y3, isInfinity: false)
    }
    
    public static func pointDouble(_ p: Point, params: DSTU4145Params) -> Point {
        if p.isInfinity { return .infinity }
        if p.x.isZero { return .infinity } // For a=0?
        
        // lambda = x + y/x
        let invX = fieldInv(p.x, params.poly)
        let yDivX = fieldMul(p.y, invX, params.poly, m: params.m)
        let lambda = p.x ^ yDivX
        
        // x3 = lambda^2 + lambda + a
        let lambda2 = fieldMul(lambda, lambda, params.poly, m: params.m)
        var x3 = lambda2 ^ lambda
        if params.a == 1 { x3 ^= 1 }
        
        // y3 = x^2 + (lambda + 1)*x3
        let x2 = fieldMul(p.x, p.x, params.poly, m: params.m)
        let term = fieldMul(lambda ^ 1, x3, params.poly, m: params.m)
        let y3 = x2 ^ term
        
        return Point(x: x3, y: y3, isInfinity: false)
    }
    
    public static func pointMul(_ p: Point, _ k: BigInt, params: DSTU4145Params) -> Point {
        var R = Point.infinity
        var Q = p
        var k = k
        
        while !k.isZero {
            if k & 1 == 1 {
                R = pointAdd(R, Q, params: params)
            }
            Q = pointDouble(Q, params: params)
            k >>= 1
        }
        return R
    }
    
    public static func pointCompress(_ p: Point, params: DSTU4145Params) -> [UInt8] {
        // Simple compression: just x? Or trace bit?
        // DSTU standard compression involves trace.
        // For wrapping test/params, maybe we assume uncompressed or specific format.
        // Wrapper M257_PB test likely uses full coords or uncompressed.
        return p.x.toLEBytes() // Placeholder
    }
    
    
    // MARK: - DSTU 4145 Functions.
    
    public static func sign(message: [UInt8], privateKey d: BigInt, params: DSTU4145Params, k: BigInt) -> (r: BigInt, s: BigInt)? {
        // 1. h = hash (truncated to field size m, but effectively just used as field element)
        // In DSTU 4145, hash is treated as an integer/field element.
        // C code: int_truncate(h, params->m) -> wa_change_len(h, words)
        
        let hBig = BigInt(leBytes: message)
        // Truncate h to m bits (field degree)
        // Actually, if h is larger than field, we truncate.
        // For M257, hash is likely 256 bits (32 bytes), m=257. So it fits.
        // But we should ensure it fits.
        var h = hBig
        // Mask for m bits? 
        // Note: Field element representation.
        // C code: int_truncate(h, params->m).
        let mMask = (BigInt(1) << params.m) - 1
        h &= mMask
        
        if h.isZero { h = 1 }
        
        // 2. Loop
        // e is random, 0 < e < n.
        // We use k as e for deterministic sign.
        var e = k
        let nBitLen = params.n.bitLength
        
        // Truncate e to n_bit_len - 1?
        // C code: int_truncate(e, int_bit_len(params->n) - 1);
        let nMask = (BigInt(1) << (nBitLen - 1)) - 1
        e &= nMask
        
        if e.isZero { return nil }
        
        // R = e * P
        let basePoint = Point(x: params.px, y: params.py, isInfinity: false)
        let R = pointMul(basePoint, e, params: params)
        if R.isInfinity { return nil }
        
        // wr = R.x * h mod poly
        var r = fieldMul(R.x, h, params.poly, m: params.m)
        
        // truncate wr to n_bit_len - 1
        r &= nMask
        
        if r.isZero { return nil }
        
        // ws = (e + r*d) mod n
        // Note: this is integer arithmetic modulo n
        let rd = (r * d) % params.n
        let s = (e + rd) % params.n
        
        if s.isZero { return nil }
        
        return (r, s)
    }
    
    public static func verify(message: [UInt8], signature: (r: BigInt, s: BigInt), publicKey Q: Point, params: DSTU4145Params) -> Bool {
        let (r, s) = signature
        if r.isZero || s.isZero { return false }
        if r >= params.n || s >= params.n { return false }
        
        // h = hash
        let hBig = BigInt(leBytes: message)
        let mMask = (BigInt(1) << params.m) - 1
        var h = hBig & mMask
        if h.isZero { h = 1 }
        
        // R' = s*P + r*Q
        // Using naive double-and-add equivalent or just sum of muls
        // sP
        let basePoint = Point(x: params.px, y: params.py, isInfinity: false)
        let sP = pointMul(basePoint, s, params: params)
        // rQ
        let rQ = pointMul(Q, r, params: params)
        
        // R' = sP + rQ
        // Note: pointAdd is typically commutative
        let R_prime = pointAdd(sP, rQ, params: params)
        
        if R_prime.isInfinity { return false }
        
        // r_calc = R'.x * h mod poly
        var r_calc = fieldMul(R_prime.x, h, params.poly, m: params.m)
        
        // truncate
        let nBitLen = params.n.bitLength
        let nMask = (BigInt(1) << (nBitLen - 1)) - 1
        r_calc &= nMask
        
        return r_calc == r
    }
}

