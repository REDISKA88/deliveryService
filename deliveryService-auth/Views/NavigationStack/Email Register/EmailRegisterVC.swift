//
//  EmailRegisterVC.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/25/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit

class EmailRegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        setTransparentNavigationBar()
        setGradientBackground(colorTop: .white, colorBottom: .systemIndigo)
        hideKeyboardWhenTappedAround()
        setupLastAndFirstNameViews()
        setupMidNameAndEmailViews()
        setupPasswordViews()
        setupEmailRegisterButton()
        
        
    }
    
    @objc func pressEmailRegisterButton(_ button: UIButton) {
        print("register pressed")
        
        
       // showToast(message: "register") if at firebase error
        // if user register success == true -> popToRoot
    }
    
    func chechTextFields() -> Bool {
        return true
    }

    func setIncorrectData(in customView: UIView) {
       customView.layer.borderWidth = 1.5
       customView.layer.animateBorderColor(from: UIColor.red, to: UIColor.clear, withDuration: 5.0)
    
    }
    
    @objc func pressDisplayPasswordOnEmailVc( _ button: UIButton!) {

        if button.tag == 0 {
            button.tag = 1
            self.userPasswordTextField.isSecureTextEntry = false
            self.confirmUserPasswordTextField.isSecureTextEntry = false
            button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            
        } else if button.tag == 1 {
            button.tag = 0
            self.userPasswordTextField.isSecureTextEntry = true
            self.confirmUserPasswordTextField.isSecureTextEntry = true
            button.setImage(UIImage(systemName: "app"), for: .normal)
        }
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            button.alpha = 0
        }) { (completion) in
            button.alpha = 1
        }
        
        
    }
    
    let lastNameView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        return view
    }()
    
    let firstNameView: UIView = {
        let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.layer.cornerRadius = 25
         view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
         return view
     }()
    let midNameView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        return view
    }()
    
    let emailView: UIView = {
        let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.layer.cornerRadius = 25
         view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
         return view
     }()
    
    let userPasswordView: UIView = {
        let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.layer.cornerRadius = 25
         view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
         return view
     }()
    
    let confirmUserPasswordView: UIView = {
        let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.layer.cornerRadius = 25
         view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
         return view
     }()
    
    let userPasswordTextField: UITextField = {
        let textfield = UITextField()
        textfield.isSecureTextEntry = true
        textfield.textContentType = .oneTimeCode
        textfield.textColor = UIColor.black.withAlphaComponent(0.9)
        textfield.textAlignment = .left
        textfield.font = .systemFont(ofSize: 19)
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7)]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .emailAddress
        textfield.backgroundColor = .clear
        textfield.layer.cornerRadius = 20
        return textfield
    }()
    
    let confirmUserPasswordTextField: UITextField = {
        let textfield = UITextField()
        textfield.isSecureTextEntry = true
        textfield.textContentType = .oneTimeCode
        textfield.textColor = UIColor.black.withAlphaComponent(0.9)
        textfield.textAlignment = .left
        textfield.font = .systemFont(ofSize: 19)
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Подтвердите пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7)]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .emailAddress
        textfield.backgroundColor = .clear
        textfield.layer.cornerRadius = 20
        return textfield
    }()
    
    let lastNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = UIColor.black.withAlphaComponent(0.9)
        textfield.textAlignment = .left
        textfield.font = .systemFont(ofSize: 19)
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Фамилия",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7)]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .emailAddress
        textfield.backgroundColor = .clear
        textfield.layer.cornerRadius = 20
        return textfield
    }()
    
    
    
    let firstNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = UIColor.black.withAlphaComponent(0.9)
        textfield.textAlignment = .left
        textfield.font = .systemFont(ofSize: 19)
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Имя",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7)]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .alphabet
        textfield.backgroundColor = .clear
        textfield.layer.cornerRadius = 20
        return textfield
    }()
    
    let midNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = UIColor.black.withAlphaComponent(0.9)
        textfield.textAlignment = .left
        textfield.font = .systemFont(ofSize: 19)
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Отчество",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7)]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .emailAddress
        textfield.backgroundColor = .clear
        textfield.layer.cornerRadius = 20
        return textfield
    }()
    
    let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = UIColor.black.withAlphaComponent(0.9)
        textfield.textAlignment = .left
        textfield.font = .systemFont(ofSize: 19)
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7)]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .emailAddress
        textfield.backgroundColor = .clear
        textfield.layer.cornerRadius = 20
        return textfield
    }()
    
    let emailRegisterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.8)
        button.layer.cornerRadius = 30
        
        return button
    }()
    
    let displayPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Показать пароль", for: .normal)
        button.setImage(UIImage(systemName: "app"), for: .normal)
        button.setTitleColor(UIColor.black.withAlphaComponent(0.8), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    

}
