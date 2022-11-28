//
//  LoginViewController.swift
//  Navigation
//
//  Created by Stas Sukhanov on 07.09.2022.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var loginDelegate: LoginViewControllerDelegate?
    
    let alertController = UIAlertController(title: "Ошибка!", message: "Не правильный логин", preferredStyle: .alert)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    lazy private var img: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logo")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy private var email: UITextField = {
        let email = UITextField()
        email.placeholder = "Email or phone"
        email.font = UIFont(name: "system", size: 16.0)
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: email.frame.height))
        email.leftViewMode = .always
        email.autocapitalizationType = .none
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    private lazy var line : UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    lazy private var password: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.font = UIFont(name: "system", size: 16.0)
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: password.frame.height))
        password.leftViewMode = .always
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    lazy private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.backgroundColor = .systemGray6
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            img.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            img.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            img.heightAnchor.constraint(equalToConstant: 100),
            img.widthAnchor.constraint(equalToConstant: 100),
            
            
            stackView.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 120),
            stackView.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            email.heightAnchor.constraint(equalToConstant: 49.75),
            email.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            email.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 0),
            
            line.heightAnchor.constraint(equalToConstant: 0.5),
            line.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            line.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 16),
            
            password.heightAnchor.constraint(equalToConstant: 49.75),
            password.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            password.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 0),
            
            button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 16),
            
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.setupGestures()
        view.backgroundColor = .white
        addViews()
        addConstraints()
        
        alertController.addAction(UIAlertAction(title: "Повторить", style: .default))
    
        
    }
    
    func addViews() {
        view.addSubview(scrollView)
        
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(line)
        stackView.addArrangedSubview(password)
        
        scrollView.addSubview(img)
        scrollView.addSubview(button)
        scrollView.addSubview(stackView)
    }
    
    
    
    //нажатие кнопки логин
    @objc func login() {

        // берем то что вводит пользователь в поле "email"
        let enteredUserLogin = email.text
        let enteredUserPassword = password.text

        // если мы в дебаг версии то меняем цвет фона, иначе оставляем все как было
        #if DEBUG
        let userLogin = TestUserService(user: User(fullName: "Test", status: "...", avatar: UIImage(named: "avatarTest") ?? UIImage()))
        #else
            let userLogin = CurrentUserService(user: User(fullname: "Prod", avatar: UIImage(named: "avatarProd") ?? UIImage(), status: "App Not Found..."))
        #endif

        if loginDelegate?.check(self, login: enteredUserLogin ?? "", password: enteredUserPassword ?? "") == true {
            let profileViewController = ProfileViewController()
            profileViewController.user_1 = userLogin.user
            navigationController?.pushViewController(profileViewController, animated: true)
        } else {
            self.present(alertController, animated: true, completion: nil)
        }
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if !button.isEnabled || button.isSelected || button.isHighlighted { button.alpha = 1 }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    //открытие клавиатуры
    @objc func didShowKeyboard(_ notification: Notification){
        print("show keyboard")
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            
            
            let loginButtonBottomPointY = self.button.frame.origin.y + button.frame.height
            
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 32
            : 0
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
    
    //сокрытие клавиатуры
    
    @objc func didHideKeyboard(_ notification: Notification){
        self.forcedHidingKeyboard()
    }
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
}

