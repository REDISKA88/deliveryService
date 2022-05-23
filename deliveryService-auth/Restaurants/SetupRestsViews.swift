//
//  SetupRestsViews.swift
//  deliveryService-auth
//
//  Created by Aura Antilochus on 5/23/22.
//  Copyright © 2022 Roman VIRUSLOKI. All rights reserved.
//

import UIKit

extension RestaurantsVC {
    
    
    func setupLogoutButton() {
        view.addSubview(logoutButton)
        
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
}
