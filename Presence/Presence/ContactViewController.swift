//
//  ContactViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/27/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class ContactViewController: UIViewController {
    
    var contact: User? = nil
    
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if let first = contact?.firstName,
            let last = contact?.lastName{
            contactNameLabel.text = "\(first) \(last)"
        }
        
        contactImage.image = contact?.image
        companyLabel.text = contact?.company
        positionLabel.text = contact?.position
        emailLabel.text = contact?.email
        
    }
    @IBAction func sendEmailButtonPressed(_ sender: UIButton) {
        //open mail composer
    }
    
    
    }
