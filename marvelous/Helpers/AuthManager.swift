//
//  AuthManagers.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 29/06/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthManager{
    
    public static let shared = AuthManager()
    private init() {}
    
    /// A method to register the user
    /// - Parameters:
    ///   - userRequest: The users information (email, password, username)
    ///   - completion: A completion with two values...
    ///   - Bool: wasRegistered - Determines if the user was registered and saved in the database correctly
    ///   - Error?: An optional error if firebase provides once
    public func registerUser(username: String, email: String, password: String, completion: @escaping (Bool, Error?)->Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": username,
                    "email": email
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil)
                }
        }
    }
    
    public func signIn(email: String, password: String, completion: @escaping (Error?)->Void) {
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    public func signOut(completion: @escaping (Error?)->Void) {
        do {
            try Auth.auth().signOut()
            print("successful?")
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    public func fetchUser(completion: @escaping (User?, Error?) -> Void) {
        
    }
    
}
