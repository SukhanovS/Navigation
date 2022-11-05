//
//  Post.swift
//  Navigation
//
//  Created by Stas Sukhanov on 14.09.2022.
//



import Foundation
import UIKit

public let itemSize = (UIScreen.main.bounds.width - 48)/4

public struct Post {
    public var author: String
    public var description: String
    public var image: UIImage?
    public var likes: Int
    public var views: Int
}

public var posts: [Post] = [
    Post(author: "Stanislav Sukhanov", description: "Chelsea FC", image: UIImage(named: "chelsea"), likes: 77, views: 100),
    Post(author: "Stanislav Sukhanov", description: "Bayern Munich", image: UIImage(named: "bayern"), likes: 5, views: 20),
    Post(author: "Stanislav Sukhanov", description: "Juventus", image: UIImage(named: "juve"), likes: 30, views: 20),
    Post(author: "Stanislav Sukhanov", description: "Real Madrid", image: UIImage(named: "real"), likes: 70, views: 90)
]
