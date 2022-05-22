
import UIKit

class CheckUserVC: UIViewController {

       let checkTextLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.text = "Введите SMS-код:"
           label.textAlignment = .center
          // label.textColor = UIColor.black.withAlphaComponent(0.9)
        label.textColor = .black
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
           
           //  midView.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.501725018, alpha: 0.06940282534)
           midView.backgroundColor = #colorLiteral(red: 0.05897665769, green: 0.5006305575, blue: 1, alpha: 0.2)
           return midView
       }()
       
       let codeNumber: UITextField = {
           let code = UITextField()
           code.placeholder = "6 знаков"
           code.textColor = .black
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
           checkCode.setTitleColor(.black, for: .normal)
           checkCode.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
           checkCode.translatesAutoresizingMaskIntoConstraints = false
           checkCode.backgroundColor = #colorLiteral(red: 0.05897665769, green: 0.5006305575, blue: 1, alpha: 0.2)
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
        codeNumber.inputAccessoryView = keyboardToolbar
    }
    
    let sendAgainButton: UIButton = {
        let sendCode = UIButton()
        sendCode.setTitle("Отправить снова", for: .normal)
      //  sendCode.setTitleColor(.gray, for: .normal)
        sendCode.translatesAutoresizingMaskIntoConstraints = false
        return sendCode
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = false

        setupCheckMiddleView()
        setupCheckButton()
        setupChechBottomView()
        addDoneButton()
    }
    
    
    @objc func checkCode() {
        print("check code func")
    }
    

}
