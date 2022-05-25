//
//  SetupEmailViews.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/25/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit

extension EmailRegisterVC {
    
    func setupEmailRegisterButton() {
        view.addSubview(emailRegisterButton)
        emailRegisterButton.centerXAnchor.constraint(equalTo: userPasswordView.centerXAnchor).isActive = true
        emailRegisterButton.bottomAnchor.constraint(equalTo: displayPasswordButton.bottomAnchor, constant: 100).isActive = true
        emailRegisterButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        emailRegisterButton.widthAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    func setupPasswordViews() {
        view.addSubview(userPasswordView)
        view.addSubview(displayPasswordButton)
        userPasswordView.addSubview(userPasswordTextField)
        
        userPasswordView.centerXAnchor.constraint(equalTo: emailView.centerXAnchor).isActive = true
        userPasswordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 20).isActive = true
        userPasswordView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor).isActive = true
        userPasswordView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor).isActive = true
        userPasswordView.heightAnchor.constraint(equalTo: emailView.heightAnchor).isActive = true
        
        userPasswordTextField.topAnchor.constraint(equalTo: userPasswordView.topAnchor, constant: 5).isActive = true
        userPasswordTextField.leadingAnchor.constraint(equalTo: userPasswordView.leadingAnchor, constant: 25).isActive = true
        userPasswordTextField.trailingAnchor.constraint(equalTo: userPasswordView.trailingAnchor, constant: -5).isActive = true
        userPasswordTextField.bottomAnchor.constraint(equalTo: userPasswordView.bottomAnchor, constant: -5).isActive = true
        
        
        displayPasswordButton.topAnchor.constraint(equalTo: userPasswordView.bottomAnchor, constant: 5).isActive = true
        displayPasswordButton.leadingAnchor.constraint(equalTo: userPasswordView.leadingAnchor, constant: 10).isActive = true
        displayPasswordButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        displayPasswordButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        displayPasswordButton.tag = 0
        displayPasswordButton.addTarget(self, action: #selector(pressDisplayPasswordOnEmailVc), for: .touchUpInside)
        
    }
    
    func setupLastAndFirstNameViews() {
        view.addSubview(lastNameView)
        view.addSubview(firstNameView)
        
        lastNameView.addSubview(lastNameTextField)
        lastNameView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        lastNameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        lastNameView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        lastNameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        lastNameView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        firstNameView.addSubview(firstNameTextField)
        firstNameView.topAnchor.constraint(equalTo: lastNameView.bottomAnchor, constant: 20).isActive = true
        firstNameView.centerXAnchor.constraint(equalTo: lastNameView.centerXAnchor).isActive = true
        firstNameView.leadingAnchor.constraint(equalTo: lastNameView.leadingAnchor).isActive = true
        firstNameView.trailingAnchor.constraint(equalTo: lastNameView.trailingAnchor).isActive = true
        firstNameView.heightAnchor.constraint(equalTo: lastNameView.heightAnchor).isActive = true
        
        
        lastNameTextField.topAnchor.constraint(equalTo: lastNameView.topAnchor, constant: 5).isActive = true
        lastNameTextField.bottomAnchor.constraint(equalTo: lastNameView.bottomAnchor, constant: -5).isActive = true
        lastNameTextField.leadingAnchor.constraint(equalTo: lastNameView.leadingAnchor, constant: 25).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: lastNameView.trailingAnchor, constant: -5).isActive = true
        
        
        
        firstNameTextField.topAnchor.constraint(equalTo: firstNameView.topAnchor, constant: 5).isActive = true
        firstNameTextField.leadingAnchor.constraint(equalTo: firstNameView.leadingAnchor, constant: 25).isActive = true
        firstNameTextField.trailingAnchor.constraint(equalTo: firstNameView.trailingAnchor, constant: -5).isActive = true
        firstNameTextField.bottomAnchor.constraint(equalTo: firstNameView.bottomAnchor, constant: -5).isActive = true
        
    }
    
    func setupMidNameAndEmailViews() {
        view.addSubview(midNameView)
        view.addSubview(emailView)
        emailView.addSubview(emailTextField)
        midNameView.addSubview(midNameTextField)
        midNameView.centerXAnchor.constraint(equalTo: firstNameView.centerXAnchor).isActive = true
        midNameView.topAnchor.constraint(equalTo: firstNameView.bottomAnchor, constant: 20).isActive = true
        midNameView.leadingAnchor.constraint(equalTo: firstNameView.leadingAnchor).isActive = true
        midNameView.trailingAnchor.constraint(equalTo: firstNameView.trailingAnchor).isActive = true
        midNameView.heightAnchor.constraint(equalTo: firstNameView.heightAnchor).isActive = true
        
        midNameTextField.topAnchor.constraint(equalTo: midNameView.topAnchor, constant: 5).isActive = true
        midNameTextField.leadingAnchor.constraint(equalTo: midNameView.leadingAnchor, constant: 25).isActive = true
        midNameTextField.trailingAnchor.constraint(equalTo: midNameView.trailingAnchor, constant: -5).isActive = true
        midNameTextField.bottomAnchor.constraint(equalTo: midNameView.bottomAnchor, constant: -5).isActive = true
        
        emailView.topAnchor.constraint(equalTo: midNameView.bottomAnchor, constant: 20).isActive = true
        emailView.centerXAnchor.constraint(equalTo: midNameView.centerXAnchor).isActive = true
        emailView.leadingAnchor.constraint(equalTo: midNameView.leadingAnchor).isActive = true
        emailView.trailingAnchor.constraint(equalTo: midNameView.trailingAnchor).isActive = true
        emailView.heightAnchor.constraint(equalTo: midNameView.heightAnchor).isActive
         = true
        
        emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 5).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 25).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 5).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -5).isActive = true
        
        
    }
    
}
