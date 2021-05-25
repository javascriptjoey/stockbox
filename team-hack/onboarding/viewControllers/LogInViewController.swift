//
//  LogInViewController.swift
//  team-hack
//
//  Created by Joey Essak on 3/10/21.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var dissmiss: UIButton!
    
    @IBAction func dissmiss(_ sender: Any) {
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dissmiss.layer.cornerRadius = 25
          // Do any additional setup after loading the view.
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
