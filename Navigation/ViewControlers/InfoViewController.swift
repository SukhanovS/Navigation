//
//  InfoViewController.swift
//  Navigation
//
//  Created by Stas Sukhanov on 17.08.2022.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    let alertController = UIAlertController(title: "Заголовок", message: "Сообщение", preferredStyle: .alert)
    
    //    создал кнопку "Закрыть"
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Закрыть", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //    создал кнопку "Внимание!"
    private let buttonAlert: UIButton = {
        let button = UIButton()
        button.setTitle("Внимание!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(closeButton)
        view.addSubview(buttonAlert)
        
        //    констрейнты
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            buttonAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAlert.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        //    таргеты кнопок
        closeButton.addTarget(self, action: #selector(showPostController), for: .touchUpInside)
        buttonAlert.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("сообщение в консоль")
        }))
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("сообщение в консоль - 2")
        }))
        
    }
    
    // функция показа алерта
    @objc func showAlert() {
        self.present(alertController, animated: true, completion: nil)
    }
    @objc func showPostController() {
        self.dismiss(animated: true, completion: nil)
    }
}
