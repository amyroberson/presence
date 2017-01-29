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
    var success: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventNameLabel.text = event?.eventName
        eventLocationLabel.text = event?.location
        eventTimeLabel.text = event?.time.toString()
        eventAddressLabel.text = event?.address
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func eventCheckInButtonPressed(_ sender: UIButton) {
        //calls enpoint to add user to event
        //sends user to event attendents page
        let dictionary: [String: Any] = [
            "email": user?.email ?? "",
            "eventName": event?.eventName ?? ""
        ]
        do {
            let data = try Util.toJson(dictionary: dictionary)
            CheckInPost().pushPostCheckIn(json: data, completion:
                //need to set week self probably
                { result in
                    switch result {
                    case .success:
                        self.success = true
                    case .failure( let resource):
                        print(resource)
                    default:
                        print("unexpected data returned")
                    }
            })
        } catch {
            print("to Json Error")
        }
        if success {
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            let eventContactVC = storyBoard.instantiateViewController(withIdentifier: "EventAttendants") as! EventAttendantViewController
            eventContactVC.event = self.event
            eventContactVC.user = user
            self.show(eventContactVC, sender: nil)
        }
    }
    
}
