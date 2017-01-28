//
//  ProfileViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var user: User? = nil
    
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (user?.showImage)! {
            privacyLabel.text = "Image privacy: Off"
        } else {
            privacyLabel.text = "Image privacy: On"
        }
        emailLabel.text = user?.email
        positionLabel.text = user?.position
        companyLabel.text = user?.company
        imageOutlet.image = user?.image
        if let _user = user {
            userNameLabel.text = "\(_user.firstName) \(_user.lastName)"
        }
        
        
    }

    
    

}
