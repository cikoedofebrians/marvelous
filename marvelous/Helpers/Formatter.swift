//
//  Formatter.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 27/06/23.
//

import Foundation
import CryptoKit


class Formatter {
    static func getHashedQuery() -> String {
//        let date = Date().description
        let rawHashed = "1\(K.privateKey)\(K.publicKey)"
        print(rawHashed)
        let hashed = rawHashed.MD5()
        return "?ts=1&apikey=\(K.publicKey)&hash=\(hashed)"
    }
}


extension String {
    func MD5() -> String {
        let digest = Insecure.MD5.hash(data: Data(self.utf8))
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
