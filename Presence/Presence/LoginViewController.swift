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
        if passwordTextField.text! != "" || emailTextField.text! != ""{
            let dictionary: [String: Any] = [
                "email" : emailTextField.text!,
                "password" : passwordTextField.text!
            ]
            do {
                let data = try Util.toJson(dictionary: dictionary)
                weak var weakSelf = self
                UserPostStore(endpoint: .login).postUserLogin(json: data, completion: {
                    result in
                    switch result{
                    case .success(let data):
                        if let _data = data as? User{
                            weakSelf?.user = _data
                        }
                    case .failure(let resource):
                        print(resource)
                    default:
                        break
                    }
                })
            } catch {
                print("json error")
            }
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            let tabVC = storyBoard.instantiateViewController(withIdentifier: "TabsMenu") as! TabsViewController
            self.show(tabVC, sender: nil)
        } else {
            failedLabel.isHidden = false
        }
        
        
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: "Register") as! RegisterViewController
        self.show(registerVC, sender: nil)
    }
    
}
