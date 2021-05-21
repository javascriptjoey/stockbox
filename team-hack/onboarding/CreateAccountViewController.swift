//
//  CreateAccountViewController.swift
//  team-hack
//
//  Created by Joey Essak on 3/14/21.
//

import UIKit

class CreateAccountViewController: UIViewController {

    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButton(_ sender: Any) {
    }
    
    @IBOutlet weak var appleSignInButton: UIButton!
    @IBAction func appleSignInButton(_ sender: Any) {
    }
    
    
    
    
    @IBAction func alreadyMemberSignInButton(_ sender: Any) {
        
    }
    
    @IBOutlet weak var fullNameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var alreadyMemberText: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        fullNameView.layer.borderWidth = 1
        fullNameView.layer.borderColor = #colorLiteral(red: 0, green: 0.7570937276, blue: 0, alpha: 1)
        fullNameView.layer.cornerRadius = 5
        
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = #colorLiteral(red: 0, green: 0.7570937276, blue: 0, alpha: 1)
        emailView.layer.cornerRadius = 5
        
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = #colorLiteral(red: 0, green: 0.7570937276, blue: 0, alpha: 1)
        passwordView.layer.cornerRadius = 5
        
        loginButton.layer.cornerRadius = 5
        appleSignInButton.layer.cornerRadius = 5 
        alreadyMemberText.halfTextColorChange(fullText: "I'm already a member, Sign In ", changeText: "Sign In")
        
        setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        
       
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
