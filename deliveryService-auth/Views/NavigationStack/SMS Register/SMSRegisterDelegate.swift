//
//  RegisterDelegate.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/22/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit

extension SMSRegisterVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          let newString = (textField.text ?? "") + string
          textField.text = formatPhoneNumberTextField(numberOfPhone: newString, shouldRemoveLastDigit: range.length == 1)
          return false
      }

       func formatPhoneNumberTextField(numberOfPhone: String, shouldRemoveLastDigit: Bool) -> String {
          guard !(shouldRemoveLastDigit && numberOfPhone.count <= 2) else { return "+" }


          let range = NSString(string: numberOfPhone).range(of: numberOfPhone)
          var number = regex.stringByReplacingMatches(in: numberOfPhone, options: [], range: range, withTemplate: "")

          if number.count > maxNumberCount {
              let maxIndex = number.index(number.startIndex, offsetBy: maxNumberCount)
              number = String(number[number.startIndex ..< maxIndex])
          }

          if shouldRemoveLastDigit {
              let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
              number = String(number[number.startIndex ..< maxIndex])
          }

          let maxIndex = number.index(number.startIndex,offsetBy:number.count)
          let regRange = number.startIndex ..< maxIndex

          if number.count < 7 {
              let pattern = "(\\d)(\\d{3})(\\d+)"
              number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3", options: .regularExpression, range: regRange)
          } else {
              let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
              number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3-$4-$5", options: .regularExpression, range: regRange)

          }

          return "+" + number
      }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 18 {
            getCodeButton.alpha = 1
            getCodeButton.isEnabled = true
        } else {
            getCodeButton.alpha = 0.5
            getCodeButton.isEnabled = false
        }
    }
}
