//
//  EventsViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/27/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let parts = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Date())
    
    var user: User? = nil
    var events: [Event?] = []{
        didSet{
            refresh()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let theDate = Calendar.current.date(from: parts)
        let dictionary: [String: Any] = [
            "name" : "IronPints",
            "address" : "here",
            "location": "M.Rich Building",
            "time": ( (theDate?.timeIntervalSince1970)! *  1000),
            "contacts" : [User(firstName: "Paul", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)]
        ]
        events = [Event(data: dictionary)!]
        self.title = "Events"
        /*let _ = EventStore().fetchEvents(completion: { result in
            switch result{
            case .success(let eventArray):
                self.events = eventArray
            default:
                print("there was an error")}
        })*/
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ sender: UITableView, numberOfRowsInSection: Int) -> Int{
        return events.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        if let _User = user{
        if (event?.contacts.contains(_User))! {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let eventAttendantsVC = storyBoard.instantiateViewController(withIdentifier: "EventAttendants") as! EventAttendantViewController
            eventAttendantsVC.user = _User
            eventAttendantsVC.event = event
            self.show(eventAttendantsVC, sender: nil)
            
        } else {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let checkInVC = storyBoard.instantiateViewController(withIdentifier: "CheckIn") as! EventCheckInViewController
            checkInVC.user = self.user
            checkInVC.event = event
            self.show(checkInVC, sender: nil)
            
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
            cell.textLabel?.text = events[indexPath.row]?.name
            return cell
    }
    
    func refresh(){
        guard Thread.current.isMainThread else {
    
        self.perform(#selector(refresh), on: Thread.main, with: nil, waitUntilDone: false)
        return
        }
        self.tableView.reloadData()
    }
    
}
