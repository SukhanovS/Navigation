//
//  FirstModule.swift
//  Navigation
//
//  Created by Stas Sukhanov on 15.08.2022.
//
import Foundation
import UIKit


class FeedViewController: UIViewController{

    var postTitle : Post1 = Post1(title: "Пост")
    
    private lazy var button = CustomButton(title: " Моя кнопка ")
    
    private lazy var textField : UITextField = {
        let textField = UITextField()
        textField.placeholder = " Введите пароль "
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var checkGuessButton = CustomButton(title: " Проверка ")
    private lazy var resultButton = CustomButton(title: " Результат ")
   
    
    private let stackViewButton : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.title = "Лента"
        
        addView()
        setConstraints()
        addButtonActions()
        
       
    }
    
    func addView(){
        //обьединяем кнопки в стеквью
        stackViewButton.addArrangedSubview(button)
        stackViewButton.addArrangedSubview(textField)
        stackViewButton.addArrangedSubview(checkGuessButton)
        stackViewButton.addArrangedSubview(resultButton)

        // отображаем все на экране
        view.addSubview(stackViewButton)
    }
    
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            stackViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 0),
            textField.leftAnchor.constraint(equalTo: stackViewButton.leftAnchor, constant: 0),
            textField.rightAnchor.constraint(equalTo: stackViewButton.rightAnchor, constant: 0),
            textField.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
        
    
    
    //функция нажатия на кнопку
    func addButtonActions(){
        button.buttonAction = {
            let detailController = PostViewControler()
            detailController.titlePost = self.postTitle.title
            self.navigationController?.pushViewController(detailController, animated: false)
        }

        // кнопка проверки пароля
        checkGuessButton.buttonAction = {
            let input = self.textField.text ?? ""
            let result : Bool = FeedModel().check(word: input)
            if result == true {
                self.resultButton.backgroundColor = .green
                self.resultButton.setTitle(" True ", for: .normal)
            } else {
                self.resultButton.backgroundColor = .red
                self.resultButton.setTitle(" False ", for: .normal)
            }
        }
    }
}
