//
//  ViewController.swift
//  trippy
//
//  Created by Paul Franco on 9/1/20.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var vacations = [Vacation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Vacation Packages"
        vacations = demoData
        
        let loginVC = LoginRegisterVC()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
        
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.contentInset.top = 8
        tableView.register(UINib(nibName: "VacationCell", bundle: nil), forCellReuseIdentifier: "VacationCell")
        
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

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacationCell", for: indexPath) as! VacationCell
        cell.configureCell(vacation: vacations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
}

