//
//  StartVC.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/23/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground(colorTop: .white, colorBottom: .systemIndigo)
        self.navigationController?.isNavigationBarHidden = true
        setupStartLabel()
        setupStartTextViews()
        setupStartButtons()
    }
    
    let startLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery Service App"
        label.textColor = UIColor.black.withAlphaComponent(0.9)
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginView: UIView = {
       let loginV = UIView()
        loginV.translatesAutoresizingMaskIntoConstraints = false
        loginV.layer.cornerRadius = 25
        loginV.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        return loginV
    }()
    
    let passwordView: UIView = {
        let passwordV = UIView()
         passwordV.translatesAutoresizingMaskIntoConstraints = false
         passwordV.layer.cornerRadius = 25
         passwordV.backgroundColor = UIColor.white.withAlphaComponent(0.3)
         return passwordV
     }()
    let loginTextField: UITextField = {
        let loginTF = UITextField()
        loginTF.textColor = .white
        loginTF.textAlignment = .center
        loginTF.font = .systemFont(ofSize: 22)
        loginTF.attributedPlaceholder = NSAttributedString(
            string: "Логин",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.8)]
        )
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        loginTF.keyboardType = .emailAddress
        loginTF.backgroundColor = .clear
        loginTF.layer.cornerRadius = 20
        return loginTF
    }()
    

    
    let passwordTextField: UITextField = {
        let password = UITextField()
        password.textColor = .white
        password.textAlignment = .center
        password.font = .systemFont(ofSize: 22)
        password.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.8)]
        )
        password.translatesAutoresizingMaskIntoConstraints = false
        password.keyboardType = .namePhonePad
        password.backgroundColor = .clear
        password.layer.cornerRadius = 20
        return password
    }()
    
    
    let loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("Вход", for: .normal)
        login.setTitleColor(UIColor.black.withAlphaComponent(0.7), for: .normal)
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        login.layer.cornerRadius = 25
        return login
    }()
    
    
    let registerButton: UIButton = {
        let register = UIButton()
        register.setTitle("Регистрация", for: .normal)
        register.setTitleColor(UIColor.black.withAlphaComponent(0.7), for: .normal)
        register.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        register.translatesAutoresizingMaskIntoConstraints = false
       register.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        register.layer.cornerRadius = 25
        return register
    }()
    
    let registerByPhoneButton: UIButton = {
        let byPhone = UIButton()
        byPhone.setTitle("Вход по SMS", for: .normal)
        byPhone.setTitleColor(UIColor.white.withAlphaComponent(1), for: .normal)
        byPhone.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        byPhone.translatesAutoresizingMaskIntoConstraints = false
        byPhone.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.8)
        byPhone.layer.cornerRadius = 25
        return byPhone
    }()
    
    @objc func goToRegisterVC() {
        let regVC = RegisterVC()
        setupBackButtonItem()
        self.navigationController?.pushViewController(regVC, animated: true)
    }
}


extension UIViewController {
    
    func setupBackButtonItem() {
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        backItem.tintColor = .black
        
        self.navigationItem.backBarButtonItem = backItem
    }
    
}
