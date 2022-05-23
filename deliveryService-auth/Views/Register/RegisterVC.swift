//
//  RegisterVC.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/21/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {
    
    let maxNumberCount = 11
    let regex =  try! NSRegularExpression(pattern:"[\\+\\s-\\(\\)]", options:.caseInsensitive)
    
    override func viewWillAppear(_ animated: Bool) {
        self.hideKeyboardWhenTappedAround()
       self.navigationController?.isNavigationBarHidden = false
       setTransparentNavigationBar()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(colorTop: .white, colorBottom: .systemIndigo)
        setupMainLabel()
        setupMiddleView()
        setupButton()
        
    }
    
    @objc func getCode() {
        hideKeyboard()
        guard let phoneNumber = phoneNumberTextField.text else { return }
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] (verifyID, error) in
            if error != nil { print(error?.localizedDescription ?? "Auth error"); print("get code error"); return }
            guard let id = verifyID else { return }
            self?.goToCheckUser(with: id)
        }
        

   
        
    }
    
    
   private func goToCheckUser(with specialID: String) {
       //        DispatchQueue.main.async {}
        let vc = CheckUserVC()
        vc.verifyUserID = specialID
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        backItem.tintColor = .black
        
        self.navigationItem.backBarButtonItem = backItem
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textColor = UIColor.black.withAlphaComponent(0.9)
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
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = .systemFont(ofSize: 18)
        return label
    }()


    let middleBackView: UIView = {
        let midView = UIView()
        
        midView.translatesAutoresizingMaskIntoConstraints = false
        midView.layer.masksToBounds = true
        midView.layer.cornerRadius = 40
        
        midView.backgroundColor = #colorLiteral(red: 0.2407030165, green: 0.2418233156, blue: 0.2445392311, alpha: 0.15)
        
        return midView
    }()

    let phoneNumberTextField: UITextField = {
        let phone = UITextField()
        phone.textColor = .white
        phone.textAlignment = .center
        phone.font = .systemFont(ofSize: 22)
        phone.attributedPlaceholder = NSAttributedString(
            string: "+7(ххх)ххх-хх-хх",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.3)]
        )
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.keyboardType = .numberPad
        phone.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
        phone.layer.cornerRadius = 20
        return phone
    }()

    let getCodeButton: UIButton = {
        let getCode = UIButton()
        getCode.setTitle("Получить код", for: .normal)
        getCode.setTitleColor(UIColor.black.withAlphaComponent(0.7), for: .normal)
        getCode.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        getCode.translatesAutoresizingMaskIntoConstraints = false
        //getCode.backgroundColor = #colorLiteral(red: 0.2407030165, green: 0.2418233156, blue: 0.2445392311, alpha: 0.7)
        getCode.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        getCode.layer.cornerRadius = 30
        return getCode
    }()
    
    
}



extension UIViewController {
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setTransparentNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
