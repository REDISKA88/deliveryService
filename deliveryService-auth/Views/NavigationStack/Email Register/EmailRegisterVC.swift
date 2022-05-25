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
        
        setupLastAndFirstNameViews()
        setupMidNameAndEmailViews()
        setupPasswordViews()
        setupEmailRegisterButton()
    }
    
    
    @objc func pressDisplayPasswordOnEmailVc( _ button: UIButton!) {
        if button.tag == 0 {
            button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            button.tag = 1
        } else if button.tag == 1 {
            button.setImage(UIImage(systemName: "app"), for: .normal)
            button.tag = 0
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
    
    let userPasswordTextField: UITextField = {
        let textfield = UITextField()
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
