//
//  User.swift
//  StorageService
//
//  Created by Stas Sukhanov on 4.11.2022.
//

import Foundation
import UIKit

protocol UserService {
    func checkUser (login: String) -> User?
}

class User {
    
    let login: String
    let fullName: String
    let status: String
    let avatar: UIImage
    
    init(login: String, fullName: String, status: String, avatar: UIImage) {
        self.login = login
        self.fullName = fullName
        self.status = status
        self.avatar = avatar
    }
}
    
    class TestUserService : UserService {
        let user : User
        
        func checkUser(login: String) -> User? {
            if user.login == login {
                return user
            }
            return nil
        }
        
        init(user: User) {
            self.user = user
        }
    }
    
    class CurrentUserService: UserService {
        
        let user: User
        
        func checkUser(login: String) -> User? {
            if user.login == login {
                return user
            }
            return user
        }
        
        init(user: User) {
            self.user = user
        }
        
    }
    

