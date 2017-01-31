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
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        failedLabel.isHidden = true
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == true{
            return false
        } else {
            textField.resignFirstResponder()
            return true
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == true{
            return false
        } else {
            textField.resignFirstResponder()
            return true
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if emailTextField.text! != ""{
            let dictionary: [String: Any] = [
                "email" : emailTextField.text!,
                "password" : passwordTextField.text!
            ]
            do {
                let data = try Util.toJson(dictionary: dictionary)
                UserPostStore(endpoint: .login).postUserLogin(json: data, completion: {
                    result in
                    OperationQueue.main.addOperation {
                        
                    switch result{
                    case .success(let data):
                        if let _data = data as? User{
                            self.user = _data
                            self.successfulLogin()
                        }
                    case .failure(let resource):
                        print(resource)
                    default:
                        break
                    }
                    }})
            } catch {
                print("json error")
            }
            
        } else {
            failedLabel.isHidden = false
        }
        
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: "Register") as! RegisterViewController
        self.show(registerVC, sender: nil)
    }
    
    func successfulLogin(){
        
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            let tabVC = storyBoard.instantiateViewController(withIdentifier: "TabsMenu") as! TabsViewController
            tabVC.user = user
            self.show(tabVC, sender: nil)
            
        
    }
    
}
