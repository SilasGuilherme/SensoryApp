//
//  MainNavigationController.swift
//  Sensory
//
//  Created by Silas Guilherme on 25/08/21.
//

import Foundation
import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .default
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "#622CC6ff")!]
    }
}
