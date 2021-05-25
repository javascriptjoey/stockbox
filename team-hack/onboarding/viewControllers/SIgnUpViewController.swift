//
//  SIgnUpViewController.swift
//  team-hack
//
//  Created by Joey Essak on 3/10/21.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class SIgnUpViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var imaNewUserLabel: UILabel!
    
    @IBAction func fogotPasswordButton(_ sender: Any) {
         performSegue(withIdentifier: "segueToForgotPassword", sender: self)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "segueToEntryPoint", sender: self)
    }
    
    @IBOutlet weak var appleButton: UIButton!
    @IBAction func appleButton(_ sender: Any) {
    }
    
    
    @IBOutlet weak var newUserSignUpButton: UIButton!
    @IBAction func newUserSignUpButton(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToCreateAccountVc", sender: self)
        
    }
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = #colorLiteral(red: 0, green: 0.7570937276, blue: 0, alpha: 1)
        emailView.layer.cornerRadius = 5
        
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = #colorLiteral(red: 0, green: 0.7570937276, blue: 0, alpha: 1)
        passwordView.layer.cornerRadius = 5
        
        loginButton.layer.cornerRadius = 5
        appleButton.layer.cornerRadius = 5
   
        imaNewUserLabel.halfTextColorChange(fullText: "I'm a new, user Sign Up", changeText: "Sign Up")
        
        self.hideKeyboardWhenTappedAround()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        
        //abstracted element styling
        setUpElements()
        
}
    func setUpElements() {
        errorLabel.isHidden = true
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
}
