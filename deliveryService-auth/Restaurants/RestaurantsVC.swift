import UIKit
import FirebaseAuth

class RestaurantsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTransparentNavigationBar()
        setGradientBackground(colorTop: .white, colorBottom: .systemIndigo)
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
        setupLogoutButton()
    }
    
    let logoutButton: UIButton = {
        let logout = UIButton()
        logout.setTitle("Выйти", for: .normal)
        logout.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .normal)
        logout.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        logout.translatesAutoresizingMaskIntoConstraints = false
        logout.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        logout.layer.cornerRadius = 25
        return logout
    }()

    
    @objc func logoutButtonTapped() {
        
        do {
            try Auth.auth().signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch { }
        
    }
}
