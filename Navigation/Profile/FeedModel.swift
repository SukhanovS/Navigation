//
//  FeedModel.swift
//  Navigation
//
//  Created by Stas Sukhanov on 18.03.2023.
//

import Foundation

struct Post1 {
    var title : String
}

struct FeedModel {
    let password : String = "secretWord"

    func check(word: String) -> Bool {
        password == word ? true : false
    }
}
