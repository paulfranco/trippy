//
//  ViewController.swift
//  trippy
//
//  Created by Paul Franco on 9/1/20.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let loginVC = LoginRegisterVC()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
    
    @IBAction func userIconClicked(_ sender: Any) {
        
        let userSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let logout = UIAlertAction(title: "Logout", style: .default) { (action) in
            // logout
            let loginVC = LoginRegisterVC()
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true)        }
        
        let manageCards = UIAlertAction(title: "Manage Credit Cards", style: .default) { (action) in
            // Display stripe widget
        }
        
        let manageBanks = UIAlertAction(title: "Manage Bank Accounts", style: .default) { (action) in
            // Manage Bank accounts
        }
        
        let close = UIAlertAction(title: "Close", style: .cancel)
        
        userSheet.addAction(manageCards)
        userSheet.addAction(manageBanks)
        userSheet.addAction(logout)
        userSheet.addAction(close)
        
        present(userSheet, animated: true)
    }


}

