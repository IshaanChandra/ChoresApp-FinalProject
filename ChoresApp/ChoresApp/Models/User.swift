//
//  User.swift
//  ChoresApp
//
//  Created by Ishaan Chandra on 7/24/18.
//  Copyright © 2018 Ishaan Chandra. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: Codable {
    
    
    let uid: String
    let username: String
    
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
    
    private static var _current: User?
    
    static var current: User{
        guard let currentUser = _current else {
            fatalError("Error: current user does not exist")
        }
        return currentUser
    }
    
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            if let data = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
            }
        }
        
        _current = user
    }
}


//class Dinosaur {
//    var name
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let T-Rex = Dinosaur(name: T-Rex)
