//
//  CheckSetupViews.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/22/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit

extension CheckUserVC {
    
    
    func setupCheckMiddleView() {
        view.addSubview(checkBackView)
        checkBackView.addSubview(checkTextLabel)
        checkBackView.addSubview(codeNumber)
        checkBackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        checkBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        checkBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        checkBackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        checkTextLabel.centerXAnchor.constraint(equalTo: checkBackView.centerXAnchor).isActive = true
        checkTextLabel.topAnchor.constraint(equalTo: checkBackView.topAnchor, constant: 25).isActive = true
        
        
        codeNumber.widthAnchor.constraint(equalToConstant: 200).isActive = true
        codeNumber.heightAnchor.constraint(equalToConstant: 50).isActive = true
        codeNumber.centerXAnchor.constraint(equalTo: checkBackView.centerXAnchor).isActive = true
        codeNumber.centerYAnchor.constraint(equalTo: checkBackView.centerYAnchor, constant: 20).isActive = true
    }
    
    
    func setupCheckButton() {
        view.addSubview(checkButton)
        checkButton.topAnchor.constraint(equalTo: checkBackView.bottomAnchor, constant: 25).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: checkBackView.leadingAnchor, constant: 50).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: checkBackView.trailingAnchor, constant: -50).isActive = true
        checkButton.bottomAnchor.constraint(equalTo: checkButton.topAnchor, constant: 60).isActive = true
        checkButton.addTarget(self, action: #selector(checkCode), for: .touchUpInside)
    }
    
    func setupChechBottomView() {
        view.addSubview(timerLabel)
        view.addSubview(sendAgainButton)
        timerLabel.centerXAnchor.constraint(equalTo: checkButton.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 40).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        sendAgainButton.centerXAnchor.constraint(equalTo: timerLabel.centerXAnchor).isActive = true
        sendAgainButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10).isActive = true
        sendAgainButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
      
        // sendAgainButton.setTitleColor(.systemBlue, for: .normal)
        sendAgainButton.setTitleColor(.gray, for: .normal)
    }
    
    
}
