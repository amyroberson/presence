//
//  LoginViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var failedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        failedLabel.isHidden = true
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false{
            return false
        } else {
            return true
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false{
            return false
        } else {
            return true
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        //set up post endpoint
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let tabVC = storyBoard.instantiateViewController(withIdentifier: "TabsMenu") as! TabsViewController
        //when endpoint is set up pass returned user to tabVC
        self.show(tabVC, sender: nil)
        
    //if false  show failed label
        
        
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: "Register") as! RegisterViewController
        self.show(registerVC, sender: nil)
    }

}
