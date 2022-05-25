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
    }
    
    
    let lastNameView: UIView = {
       let loginV = UIView()
        loginV.translatesAutoresizingMaskIntoConstraints = false
        loginV.layer.cornerRadius = 25
        loginV.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        return loginV
    }()
    
    let firstNameView: UIView = {
        let passwordV = UIView()
         passwordV.translatesAutoresizingMaskIntoConstraints = false
         passwordV.layer.cornerRadius = 25
         passwordV.backgroundColor = UIColor.white.withAlphaComponent(0.3)
         return passwordV
     }()
    let lastNameField: UITextField = {
        let loginTF = UITextField()
        loginTF.textColor = .white
        loginTF.textAlignment = .center
        loginTF.font = .systemFont(ofSize: 22)
        loginTF.attributedPlaceholder = NSAttributedString(
            string: "Фамилия",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.8)]
        )
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        loginTF.keyboardType = .emailAddress
        loginTF.backgroundColor = .clear
        loginTF.layer.cornerRadius = 20
        return loginTF
    }()
    
    
    
    let firstNameTextField: UITextField = {
        let password = UITextField()
        password.textColor = .white
        password.textAlignment = .center
        password.font = .systemFont(ofSize: 22)
        password.attributedPlaceholder = NSAttributedString(
            string: "Имя",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.8)]
        )
        password.translatesAutoresizingMaskIntoConstraints = false
        password.keyboardType = .namePhonePad
        password.backgroundColor = .clear
        password.layer.cornerRadius = 20
        return password
    }()
    
    

}
