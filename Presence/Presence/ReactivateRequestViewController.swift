//
//  ReactivateRequestViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class ReactivateRequestViewController: UIViewController {

    var contact: User? = nil
    var request: Request? = nil
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = contact?.fullName
        userImage.image = contact?.image
    }
    
    @IBAction func reactivateButtonPressed(_ sender: UIButton) {
        //dismiss view or grey out button and show a label"reactivated!"
    }

}
