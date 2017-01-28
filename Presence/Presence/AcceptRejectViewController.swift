//
//  AcceptRejectViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class AcceptRejectViewController: UIViewController {

    var contact: User? = nil
    var request: Request? = nil
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = contact?.fullName
        userImage.image = contact?.image

    }
   

    @IBAction func acceptButtonTapped(_ sender: UIButton) {
        //dismiss view
    }
    @IBAction func rejectButtonTapped(_ sender: UIButton) {
        //dismiss view
    }
}
