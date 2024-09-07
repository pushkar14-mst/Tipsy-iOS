//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Pushkar Patil on 9/6/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel:UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var result:String = ""
    var tip:Int = 0
    var split:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text=result
        settingsLabel.text="Split between \(split) people, with \(tip)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true,completion: nil)
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
