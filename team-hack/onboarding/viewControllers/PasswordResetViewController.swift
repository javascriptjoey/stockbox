//
//  PasswordResetViewController.swift
//  team-hack
//
//  Created by Joey Essak on 5/20/21.
//

import UIKit
import Lottie
class PasswordResetViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    
    @IBAction func continueToLoginButton(_ sender: Any) {
        
        performSegue(withIdentifier: "segueBackToLogin", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonName = "newCon"
        let animation = Animation.named(jsonName)
        animationView.animation = animation
        animationView.play()
        // Do any additional setup after loading the view.
    }

}
