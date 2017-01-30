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
    var success: Bool = false{
        didSet{
            successfulCheckIn()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventNameLabel.text = event?.eventName
        eventLocationLabel.text = event?.location
        eventTimeLabel.text = event?.time.toString()
        eventAddressLabel.text = event?.address
        
    }
    
    @IBAction func eventCheckInButtonPressed(_ sender: UIButton) {
        let dictionary: [String: Any] = [
            "guestEmail": user?.email ?? "",
            "eventName": event?.eventName ?? ""
        ]
        do {
            let data = try Util.toJson(dictionary: dictionary)
            weak var weakSelf = self
            CheckInPost().pushPostCheckIn(json: data, completion:
                { result in
                    switch result {
                    case .success(let event):
                        weakSelf?.event = event
                        weakSelf?.successfulCheckIn()
                    case .failure( let resource):
                        print(resource)
                    default:
                        print("unexpected data returned")
                    }
            })
        } catch {
            print("to Json Error")
        }
    }
    
    func successfulCheckIn(){
        
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            let eventContactVC = storyBoard.instantiateViewController(withIdentifier: "EventAttendants") as! EventAttendantViewController
            eventContactVC.event = self.event
            eventContactVC.user = self.user
            self.show(eventContactVC, sender: nil)
        }
    }
    
}
