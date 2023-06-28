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
        let hashed = rawHashed.MD5()
        return "?ts=1&apikey=\(K.publicKey)&hash=\(hashed)"
    }
}
