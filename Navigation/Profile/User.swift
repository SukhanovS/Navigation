//
//  User.swift
//  StorageService
//
//  Created by Stas Sukhanov on 4.11.2022.
//

import Foundation
import UIKit



class User {
    
    let fullName: String
    let status: String
    let avatar: UIImage
    
    init(fullName: String, status: String, avatar: UIImage) {
        self.fullName = fullName
        self.status = status
        self.avatar = avatar
    }
}
    
    class TestUserService {
        let user : User
        
        init(user: User) {
            self.user = user
        }
    }
    
    class CurrentUserService {
        
        let user: User
        
           
        
        init(user: User) {
            self.user = user
        }
        
    }
    

