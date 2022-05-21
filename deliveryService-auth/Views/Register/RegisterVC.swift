//
//  RegisterVC.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/21/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textColor = UIColor.black.withAlphaComponent(1)
       // label.textColor = #colorLiteral(red: 0, green: 0.6786748171, blue: 1, alpha: 1)
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let midTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите номер телефона:"
        label.textAlignment = .center
        label.textColor = UIColor.black.withAlphaComponent(0.9)
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    
    let middleBackView: UIView = {
        let midView = UIView()
        
        midView.translatesAutoresizingMaskIntoConstraints = false
        midView.layer.masksToBounds = true
        midView.layer.cornerRadius = 40
        
        midView.backgroundColor = #colorLiteral(red: 0.05897665769, green: 0.5006305575, blue: 1, alpha: 0.2)
        
        return midView
    }()
    
    let phoneNumber: UITextField = {
        let phone = UITextField()
        phone.placeholder = "+7(ххх)ххх-хх-хх"
        phone.textColor = .black
        phone.textAlignment = .center
        phone.font = .systemFont(ofSize: 22)
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.keyboardType = .numberPad
        phone.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
        phone.layer.cornerRadius = 20
        return phone
    }()
    
    let getCodeButton: UIButton = {
        let getCode = UIButton()
        getCode.setTitle("Получить код", for: .normal)
        getCode.setTitleColor(.black, for: .normal)
        getCode.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        getCode.translatesAutoresizingMaskIntoConstraints = false
        getCode.backgroundColor = #colorLiteral(red: 0.05897665769, green: 0.5006305575, blue: 1, alpha: 0.2)
        getCode.layer.cornerRadius = 30
        return getCode
    }()

    let maxNumberCount = 11
    let regex =  try! NSRegularExpression(pattern:"[\\+\\s-\\(\\)]", options:.caseInsensitive)
    
    override func viewWillAppear(_ animated: Bool) {
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMainLabel()
        setupMiddleView()
        setupButton()
    }
    
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc func getCode() {
        hideKeyboard()
        DispatchQueue.main.async {
            let vc = CheckUserVC()
            let backItem = UIBarButtonItem()
            backItem.title = "Назад"
            backItem.tintColor = .black
            
            self.navigationItem.backBarButtonItem = backItem
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
