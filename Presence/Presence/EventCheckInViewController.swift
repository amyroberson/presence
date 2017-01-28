//
//  EventCheckInViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class EventCheckInViewController: UIViewController {
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventAddressLabel: UILabel!

    var event: Event? = nil
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventNameLabel.text = event?.name
        eventLocationLabel.text = event?.location
        eventTimeLabel.text = event?.time.toString()
        eventAddressLabel.text = event?.address

        // Do any additional setup after loading the view.
    }

    @IBAction func eventCheckInButtonPressed(_ sender: UIButton) {
        //calls enpoint to add user to event
        //sends user to event attendents page
    }

}
