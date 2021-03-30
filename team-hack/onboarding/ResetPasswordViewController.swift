//
//  ResetPasswordViewController.swift
//  team-hack
//
//  Created by Joey Essak on 3/14/21.
//

import UIKit
import Lottie
class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var sendInstructionButton: UIButton!
    @IBAction func sendInstructionButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        emailView.layer.cornerRadius =  5
        
        sendInstructionButton.layer.cornerRadius = 5
        
        let jsonName = "testKeys"
        let animation = Animation.named(jsonName)
        animationView.animation = animation
        animationView.play()
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
