//
//  Checker.swift
//  Navigation
//
//  Created by Stas Sukhanov on 27.11.2022.
//

import Foundation
import UIKit

protocol LoginViewControllerDelegate {
    
    func check(_ sender: LoginViewController, login: String, password: String)->Bool
    
}

class Checker {
    
    static let shared = Checker()
    
    private let login = "Login"
    private let password = "Password"
    
    func checker(login: String, password: String) -> Bool {
        self.login == login && self.password == password ? true : false
        
    }
    private init(){
        
    }
    
}

struct LoginInspector: LoginViewControllerDelegate{
    func check(_ sender: LoginViewController, login: String, password: String) -> Bool {
        return (Checker.shared.checker(login: login, password: password))
    }
}


protocol LoginFactory {
    
    func makeLoginInspector() -> LoginInspector
}


struct MyLoginFactory : LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
