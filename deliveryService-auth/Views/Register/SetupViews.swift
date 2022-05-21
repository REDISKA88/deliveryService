//
//  SetupViews.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/21/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit


extension RegisterVC {
    
    func setupMainLabel() {
        view.addSubview(mainLabel)
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
    }
  
    
    func setupMiddleView() {
        view.addSubview(middleBackView)
        middleBackView.addSubview(midTextLabel)
        middleBackView.addSubview(phoneNumber)
        middleBackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50).isActive = true
        middleBackView.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor, constant: -100).isActive = true
        middleBackView.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: 100).isActive = true
        middleBackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        midTextLabel.centerXAnchor.constraint(equalTo: middleBackView.centerXAnchor).isActive = true
        midTextLabel.topAnchor.constraint(equalTo: middleBackView.topAnchor, constant: 25).isActive = true
        
        phoneNumber.delegate = self
        phoneNumber.widthAnchor.constraint(equalToConstant: 250).isActive = true
        phoneNumber.heightAnchor.constraint(equalToConstant: 50).isActive = true
        phoneNumber.centerXAnchor.constraint(equalTo: middleBackView.centerXAnchor).isActive = true
        phoneNumber.centerYAnchor.constraint(equalTo: middleBackView.centerYAnchor, constant: 20).isActive = true
    }
    
    
    func setupButton() {
        view.addSubview(getCodeButton)
        getCodeButton.topAnchor.constraint(equalTo: middleBackView.bottomAnchor, constant: 25).isActive = true
        getCodeButton.leadingAnchor.constraint(equalTo: middleBackView.leadingAnchor, constant: 50).isActive = true
        getCodeButton.trailingAnchor.constraint(equalTo: middleBackView.trailingAnchor, constant: -50).isActive = true
        getCodeButton.bottomAnchor.constraint(equalTo: getCodeButton.topAnchor, constant: 60).isActive = true
        getCodeButton.addTarget(self, action: #selector(getCode), for: .touchUpInside)
    }
    
}
