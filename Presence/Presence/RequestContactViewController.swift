//
//  RequestContactViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class RequestContactViewController: UIViewController {

    var user: User? = nil
    var contact: User? = nil
    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var contactNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        contactNameLabel.text = contact?.fullName
        if contact?.showImage == false{
            contactImage.isHidden = true
        } else {
        contactImage.image = contact?.image
        }
    }

    
    @IBAction func requestButtonPressed(_ sender: UIButton) {
        //sends request post with contact and user
        //create request
    }

}
