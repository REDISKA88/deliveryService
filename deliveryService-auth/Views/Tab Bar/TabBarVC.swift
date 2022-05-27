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
        setupTabBar()
        setImagesForTabBarItems()
        setGradientBackground(colorTop: .white, colorBottom: .systemIndigo)
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser?.uid == nil {
            openStartScreen()
        }
    }
    private func setupTabBar() {
        self.tabBar.barTintColor = .systemIndigo
        self.tabBar.tintColor = .white
       
       let placesBarController = RestaurantsVC()
       let placesNavigationController = UINavigationController(rootViewController: placesBarController)

        
        let shopBarController = ShopVC()
        let shopNavigationController = UINavigationController(rootViewController: shopBarController)
       
        let profileBarController = ProfileVC()
        let profileNavigationController = UINavigationController(rootViewController: profileBarController)
        
        self.setViewControllers([placesNavigationController, shopNavigationController, profileNavigationController], animated: false)
    }
    
    private func setImagesForTabBarItems() {
        let images = [UIImage(systemName: "mappin.and.ellipse"), UIImage(systemName: "cart"), UIImage(systemName: "person")]
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
