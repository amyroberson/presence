//
//  ViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/25/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var image: UIImage? = UIImage(named: "synthwave"){
        didSet{
            refresh()
        }
    }
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var privacySwitch: UISwitch!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.image = image
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        companyTextField.delegate = self
        positionTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        moreInfoLabel.isHidden = true
    }
    
    @IBAction func selectPhotoButtonPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        refresh()
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == true {
            return false
        } else {
            textField.resignFirstResponder()
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == true {
            return false
        } else {
            textField.resignFirstResponder()
            return true
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let original = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = original
        }
        refresh()
        dismiss(animated: true, completion:nil)
    }
    
    @IBAction func RegisterButtonTapped(_ sender: UIButton) {
        if firstNameTextField.text! != "" || lastNameTextField.text! != "" ||
            companyTextField.text! != "" || positionTextField.text! != "" || emailTextField.text! != "" ||
            passwordTextField.text! != "" {
            
            if let firstname = firstNameTextField.text,
                let lastName = lastNameTextField.text,
                let company  = companyTextField.text,
                let position = positionTextField.text,
                let email = emailTextField.text,
                let password = passwordTextField.text,
                let image = userImage.image {
                var showImage: Bool
                if privacySwitch.isOn {
                    showImage = false
                } else {
                    showImage = true
                }
                var user = User(firstName: firstname, lastName: lastName, company: company, position: position, email: email, password: password, showImage: showImage, image: image)
                let dictionary = user.toDictionary()
                do {
                    let data = try Util.toJson(dictionary: dictionary)
                    UserPostStore(endpoint: .addUser).pushPostRegister(json: data, completion: { result in
                        switch result{
                        case .success(let data):
                            if let _data = data as? User{
                                user = _data
                            }
                        case .failure(let resource):
                            print(resource)
                        default:
                            break
                        }
                    })
                } catch {
                    print("toJson Error")
                }
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                let tabsVC = storyboard.instantiateViewController(withIdentifier: "TabsMenu") as! TabsViewController
                tabsVC.user = user
                self.present(tabsVC, animated: true, completion: nil)
            }
        } else {
            moreInfoLabel.isHidden = false
        }
    }
    
    func refresh(){
        userImage.image = image
    }
    
}

