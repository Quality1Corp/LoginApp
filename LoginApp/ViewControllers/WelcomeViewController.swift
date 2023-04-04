//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by MikhaiL on 04.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet private var welcomeName: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeName.text = "Welcome, \(userName)"
    }
}
