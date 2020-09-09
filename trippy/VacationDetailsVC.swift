//
//  VacationDetailsVC.swift
//  trippy
//
//  Created by Paul Franco on 9/9/20.
//

import UIKit

class VacationDetailsVC: UIViewController {
    
    @IBOutlet weak var activitiesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var vacation: Vacation!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = vacation.title
        activitiesLabel.text = vacation.activities
        descriptionLabel.text = vacation.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
