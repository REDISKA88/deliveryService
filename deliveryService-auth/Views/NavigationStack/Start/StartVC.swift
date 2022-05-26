//
//  StartVC.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/23/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit
import FirebaseAuth

class StartVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            if Auth.auth().currentUser?.uid != nil {
                self.dismiss(animated: false, completion: nil)
                // TabBar vc in future
//                let restsVc = RestaurantsVC()
//                self.navigationController?.pushViewController(restsVc, animated: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground(colorTop: .white, colorBottom: .systemIndigo)
        hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
        setupStartLabel()
        setupStartTextViews()
        setupStartButtons()
    }
    
    
    @objc func loginButtonPressed() {
        hideKeyboard()
        guard let userLogin = loginTextField.text, let userPassword = passwordTextField.text, userLogin.isEmpty == false, userPassword.isEmpty == false else {
            print("guard userlogin password error")
            return
        }
        Auth.auth().signIn(withEmail: userLogin, password: userPassword) { [weak self] (user, error) in
            if error != nil {
                if error?.localizedDescription == "The email address is badly formatted." {
                    self?.showToast(message: "Введен некорректный email", forStart: true)
                }
                if error?.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted." {
                    self?.showToast(message: "Такого пользователя не существует", forStart: true)
                }
                return
            }
            if user != nil {
                self?.dismiss(animated: true, completion: nil)
            }
            self?.showToast(message: "Такого пользователя не существует", forStart: true)
        }
    }
    
    let startLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery Service App"
        label.textColor = UIColor.black.withAlphaComponent(0.9)
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginView: UIView = {
       let loginV = UIView()
        loginV.translatesAutoresizingMaskIntoConstraints = false
        loginV.layer.cornerRadius = 25
        loginV.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        return loginV
    }()
    
    let passwordView: UIView = {
        let passwordV = UIView()
         passwordV.translatesAutoresizingMaskIntoConstraints = false
         passwordV.layer.cornerRadius = 25
         passwordV.backgroundColor = UIColor.white.withAlphaComponent(0.3)
         return passwordV
     }()
    let loginTextField: UITextField = {
        let loginTF = UITextField()
        loginTF.textColor = UIColor.black.withAlphaComponent(0.7)
        loginTF.textAlignment = .center
        loginTF.font = .systemFont(ofSize: 22)
        loginTF.attributedPlaceholder = NSAttributedString(
            string: "Логин",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.8)]
        )
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        loginTF.keyboardType = .emailAddress
        loginTF.backgroundColor = .clear
        loginTF.layer.cornerRadius = 20
        return loginTF
    }()
    

    
    let passwordTextField: UITextField = {
        let password = UITextField()
        password.isSecureTextEntry = true
        password.textContentType = .oneTimeCode
        password.textColor = UIColor.black.withAlphaComponent(0.7)
        password.textAlignment = .center
        password.font = .systemFont(ofSize: 22)
        password.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.8)]
        )
        password.translatesAutoresizingMaskIntoConstraints = false
        password.keyboardType = .namePhonePad
        password.backgroundColor = .clear
        password.layer.cornerRadius = 20
        return password
    }()
    
    
    let loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("Вход", for: .normal)
        login.setTitleColor(UIColor.black.withAlphaComponent(0.7), for: .normal)
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        login.layer.cornerRadius = 25
        return login
    }()
    
    
    let registerButton: UIButton = {
        let register = UIButton()
        register.setTitle("Регистрация", for: .normal)
        register.setTitleColor(UIColor.black.withAlphaComponent(0.7), for: .normal)
        register.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        register.translatesAutoresizingMaskIntoConstraints = false
       register.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        register.layer.cornerRadius = 25
        return register
    }()
    
    let registerByPhoneButton: UIButton = {
        let byPhone = UIButton()
        byPhone.setTitle("Вход по SMS", for: .normal)
        byPhone.setTitleColor(UIColor.white.withAlphaComponent(1), for: .normal)
        byPhone.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        byPhone.translatesAutoresizingMaskIntoConstraints = false
        byPhone.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.8)
        byPhone.layer.cornerRadius = 25
        return byPhone
    }()
    
    @objc func goToSMSRegisterVC() {
        let regVC = SMSRegisterVC()
        setupBackButtonItem()
        self.navigationController?.pushViewController(regVC, animated: true)
    }
    
    @objc func goToEmailRegisterVC() {
        let regVC = EmailRegisterVC()
        setupBackButtonItem()
        regVC.title = "Регистрация"
        self.navigationController?.pushViewController(regVC, animated: true)
    }
}


extension UIViewController {
    
    func setupBackButtonItem() {
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        backItem.tintColor = .black
        
        self.navigationItem.backBarButtonItem = backItem
    }
    
    func setIncorrectData(in customView: UIView){
        customView.layer.borderWidth = 1.5
        customView.layer.animateBorderColor(from: UIColor.red, to: UIColor.clear, withDuration: 5.0)
    }
    
    func showToast(message: String, forStart: Bool) {
        var heightPos = self.view.frame.height - 100
        if forStart == true {
            heightPos = self.view.frame.height - 200
        }
        let toast = UILabel(frame: CGRect(x: self.view.frame.width/2-90, y: heightPos, width: 180, height: 55))
        toast.textAlignment = .center
        toast.numberOfLines = 0
        toast.backgroundColor = UIColor.systemRed.withAlphaComponent(0.7)
        toast.textColor = .white
        toast.font = UIFont.systemFont(ofSize: 18)
        toast.alpha = 1
        toast.layer.cornerRadius = 15
        toast.clipsToBounds = true
        toast.text = message
        self.view.addSubview(toast)
        UIView.animate(withDuration: 5, delay: 1, options: .curveEaseInOut, animations: {
            toast.alpha = 0
        }) { (completion) in
            toast.removeFromSuperview()
        }
    }

    
}

extension CALayer {

func animateBorderColor(from startColor: UIColor, to endColor: UIColor, withDuration duration: Double) {
    let colorAnimation = CABasicAnimation(keyPath: "borderColor")
    colorAnimation.fromValue = startColor.cgColor
    colorAnimation.toValue = endColor.cgColor
    colorAnimation.duration = duration
    self.borderColor = endColor.cgColor
    self.add(colorAnimation, forKey: "borderColor")
}

}
