//
//  FirstModule.swift
//  Navigation
//
//  Created by Stas Sukhanov on 15.08.2022.
//
import Foundation
import UIKit

struct Post1 {
    var title : String
}

class FeedViewController: UIViewController{
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navBarCustomization()
    }
    
    // MARK: Customization and Grouping Functions
    
    func navBarCustomization () {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationItem.title = "Лента"
    }
    
    
    
    var postTitle = Post1(title: "Пост")
    
    
    
    // создаем кнопку "Посмотреть пост"
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Посмотреть пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //задаем констрейнты для кнопки
    func setConstraints(){
        
        
        NSLayoutConstraint.activate([
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
    //функция нажатия на кнопку
    @objc func showPostController() {
        let detailController = PostViewControler()
        detailController.titlePost = postTitle.title
        navigationController?.pushViewController(detailController, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.title = "Лента"
        
        
        //отображение на экране
        view.addSubview(button)
        
        setConstraints()
        
        button.addTarget(self, action: #selector(showPostController), for: .touchUpInside)
    }
    
    
    
}
