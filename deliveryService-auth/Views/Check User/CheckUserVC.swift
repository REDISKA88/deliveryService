
import UIKit
import FirebaseAuth
class CheckUserVC: UIViewController {
    
    var verifyUserID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(colorTop: .white, colorBottom: .systemIndigo)
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = false
        setTransparentNavigationBar()
        setupCheckMiddleView()
        setupCheckButton()
        setupChechBottomView()
        addDoneButton()
        setupConfig()
    }
    
    
    func setupConfig() {
        checkButton.alpha = 0.5
        checkButton.isEnabled = false
    }
    
    @objc func checkCode() {
        guard let smsCode = codeNumberTextField.text else { return }
        
        let idCredential = PhoneAuthProvider.provider().credential(withVerificationID: verifyUserID!, verificationCode: smsCode)
        Auth.auth().signIn(with: idCredential) { [weak self] (_, error) in
            if error != nil {
                let invalidCodeAC = UIAlertController(title: "Неверный код", message: error?.localizedDescription, preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Отмена", style: .cancel)
                invalidCodeAC.addAction(cancel)
                self?.present(invalidCodeAC, animated: true)
            } else {
                self?.goToRestsVC()
            }
        }
    }
    
    private func goToRestsVC() {
        let restsVc = RestaurantsVC()
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        backItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backItem
        self.navigationController?.pushViewController(restsVc, animated: true)
    }
    
    let checkTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите SMS-код:"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "01:59"
        label.textAlignment = .center
        label.textColor = UIColor.gray.withAlphaComponent(0.8)
        label.font = .italicSystemFont(ofSize: 20)
        return label
    }()
    
    let checkBackView: UIView = {
        let midView = UIView()
        
        midView.translatesAutoresizingMaskIntoConstraints = false
        midView.layer.masksToBounds = true
        midView.layer.cornerRadius = 40
        midView.backgroundColor = #colorLiteral(red: 0.2407030165, green: 0.2418233156, blue: 0.2445392311, alpha: 0.15)
        return midView
    }()
    
    let codeNumberTextField: UITextField = {
        let code = UITextField()
        code.attributedPlaceholder = NSAttributedString(
            string: "6 знаков",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText.withAlphaComponent(0.3)]
        )
        code.textColor = .white
        code.textAlignment = .center
        code.font = .systemFont(ofSize: 22)
        code.keyboardType = .numberPad
        code.translatesAutoresizingMaskIntoConstraints = false
        code.backgroundColor = UIColor.lightGray.withAlphaComponent(0.05)
        code.layer.cornerRadius = 20
        return code
    }()
    
    let checkButton: UIButton = {
        let checkCode = UIButton()
        checkCode.setTitle("Продолжить", for: .normal)
        checkCode.setTitleColor(UIColor.black.withAlphaComponent(0.7), for: .normal)
        checkCode.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        checkCode.translatesAutoresizingMaskIntoConstraints = false
        checkCode.backgroundColor = UIColor.white.withAlphaComponent(1)
        checkCode.layer.cornerRadius = 30
        return checkCode
    }()
    
    func addDoneButton() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                            target: view, action: #selector(UIView.endEditing(_:)))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        codeNumberTextField.inputAccessoryView = keyboardToolbar
    }
    
    let sendAgainButton: UIButton = {
        let sendCode = UIButton()
        sendCode.setTitle("Отправить снова", for: .normal)
        sendCode.translatesAutoresizingMaskIntoConstraints = false
        return sendCode
    }()
    
    
}
