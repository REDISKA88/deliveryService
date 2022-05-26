//
//  SetupStartViews.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/23/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit

extension StartVC {
    func setupStartLabel() {
        view.addSubview(startLabel)
        startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        startLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        
        startLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        
        startLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    
    func setupStartTextViews() {
        view.addSubview(loginView)
        view.addSubview(passwordView)
        
        loginView.addSubview(loginTextField)
        passwordView.addSubview(passwordTextField)
        
        loginView.centerXAnchor.constraint(equalTo: startLabel.centerXAnchor).isActive = true
        loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        loginView.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 70).isActive = true
        loginView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        passwordView.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 20).isActive = true
        passwordView.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        passwordView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor).isActive = true
        passwordView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor).isActive = true
        passwordView.heightAnchor.constraint(equalTo: loginView.heightAnchor).isActive = true
        
        
        loginTextField.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 5).isActive = true
        loginTextField.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -5).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 10).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -5).isActive = true
        
        
        
        passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 5).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -5).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 10).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -5).isActive = true
        
    }
    
    
    func setupStartButtons() {
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(registerByPhoneButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 25).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor).isActive = true
        
        registerButton.addTarget(self, action: #selector(goToEmailRegisterVC), for: .touchUpInside)
        
        registerByPhoneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        registerByPhoneButton.centerXAnchor.constraint(equalTo: registerButton.centerXAnchor).isActive = true
        registerByPhoneButton.widthAnchor.constraint(equalTo: registerButton.widthAnchor, constant: 0).isActive = true
        registerByPhoneButton.heightAnchor.constraint(equalTo: registerButton.heightAnchor, constant: 0).isActive = true
        
        registerByPhoneButton.addTarget(self, action: #selector(goToSMSRegisterVC), for: .touchUpInside)
        
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
}
