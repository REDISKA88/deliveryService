//
//  TabBarVC.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/25/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit
import FirebaseAuth
class TabBarVC: UITabBarController {
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
         setupTabBar()
        setImagesForTabBarItems()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser?.uid == nil {
            openStartScreen()
        }
        
    
    }
    private func setupTabBar() {
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .white
       
        
        
       let homeBarController = RestaurantsVC()
       let homeNavigationController = UINavigationController(rootViewController: homeBarController)
          homeNavigationController.navigationBar.tintColor = .clear
        
        
        self.setViewControllers([homeNavigationController], animated: false)
    }
    
    private func setImagesForTabBarItems() {
        let images = [UIImage(systemName: "house")]
        guard let tabBarItems = self.tabBar.items else { return }
        for tabBar in tabBarItems.enumerated() {
            tabBar.element.image = images[tabBar.offset]
        }
    }
    
}
extension UIViewController {
     func openStartScreen() {
        DispatchQueue.main.async {
            let StartScreenVc = StartVC()
            let navigationVc = UINavigationController(rootViewController: StartScreenVc)
            navigationVc.modalPresentationStyle = .fullScreen
            self.present(navigationVc, animated: false)
        }
    }
}
