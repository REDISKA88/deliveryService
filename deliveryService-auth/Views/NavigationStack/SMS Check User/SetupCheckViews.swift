//
//  CheckSetupViews.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/22/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit

extension SMSCheckUserVC {
    
    
    func setupCheckMiddleView() {
        view.addSubview(checkBackView)
        checkBackView.addSubview(checkTextLabel)
        checkBackView.addSubview(codeNumberTextField)
        checkBackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        checkBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        checkBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        checkBackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        checkTextLabel.centerXAnchor.constraint(equalTo: checkBackView.centerXAnchor).isActive = true
        checkTextLabel.topAnchor.constraint(equalTo: checkBackView.topAnchor, constant: 25).isActive = true
        
        codeNumberTextField.delegate = self
        codeNumberTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        codeNumberTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        codeNumberTextField.centerXAnchor.constraint(equalTo: checkBackView.centerXAnchor).isActive = true
        codeNumberTextField.centerYAnchor.constraint(equalTo: checkBackView.centerYAnchor, constant: 20).isActive = true
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
      
        //sendAgainButton.setTitleColor(.systemBlue, for: .normal)
        timerLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        sendAgainButton.setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .normal)
    }

}

extension SMSCheckUserVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentChars = textField.text?.count ?? 0
        if range.length + range.location > currentChars { return false }
        
        let newLength = currentChars + string.count - range.length
        return newLength <= 6
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 6 {
            checkButton.alpha = 1
            checkButton.isEnabled = true
        } else {
            checkButton.alpha = 0.5
            checkButton.isEnabled = false
        }
    }
}
