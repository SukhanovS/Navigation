//
//  User.swift
//  StorageService
//
//  Created by Stas Sukhanov on 4.11.2022.
//

import Foundation
import UIKit

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
