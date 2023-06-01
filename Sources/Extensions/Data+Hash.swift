//
//  Data+Hash.swift
//  Tiercel
//
//  Created by Daniels on 2019/1/22.
//  Copyright © 2019 Daniels. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import CommonCrypto
import CryptoKit
import Foundation

extension Data: TiercelCompatible { }

protocol DigestData {
}

protocol HashDigest: HashFunction {
    func finalize() -> Digest
}

extension Insecure.MD5: HashDigest {
}

extension Insecure.SHA1: HashDigest {
}

extension SHA256: HashDigest {
}

extension SHA512: HashDigest {
}

extension TiercelWrapper where Base == Data {
    @inline(__always)
    private func hashBase(_ hasher: any HashDigest) -> String {
        var hasher = hasher
        hasher.update(data: base)
        return hasher.finalize().map { String(format: "%02x", $0) }.joined()
    }

    public var md5: String {
        return hashBase(Insecure.MD5())
    }

    public var sha1: String {
        return hashBase(Insecure.SHA1())
    }

    public var sha256: String {
        return hashBase(SHA256())
    }

    public var sha512: String {
        return hashBase(SHA512())
    }
}
