//
//  PostViewController.swift
//  Navigation
//
//  Created by Stas Sukhanov on 17.08.2022.
//

import Foundation
import UIKit

class PostViewControler: UIViewController {
    
    
    
    var titlePost: String = ""
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(titleLabel)
        titleLabel.text = titlePost
        
        //констрейнты
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        //создал UIBarButtonItem
        let modal = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showModal))
        navigationItem.rightBarButtonItems = [modal]
    }
    //    функция для отображения  в InfoViewController
    @objc func showModal() {
        let popUpViewController = InfoViewController()
        popUpViewController.modalPresentationStyle = .fullScreen
        self.present(popUpViewController, animated: true, completion: nil)
        
    }
}
