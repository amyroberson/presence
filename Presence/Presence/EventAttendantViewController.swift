//
//  EventAttendantViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class EventAttendantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var user: User? = nil
    var event: Event? = nil
    var contacts: [User] {
        var _contacts: [User] = []
        if let _event = event{
            _contacts = _event.guests
        }
        return _contacts
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventAddressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none

        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        eventNameLabel.text = event?.eventName
        eventLocationLabel.text = event?.location
        eventAddressLabel.text = event?.address
        eventTimeLabel.text = event?.time.toString()
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttendantCell", for: indexPath) as! AttendantCell
        cell.userLabel?.text = contacts[indexPath.row].fullName
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let requestVC = storyBoard.instantiateViewController(withIdentifier: "RequestContact") as! RequestContactViewController
        requestVC.user = user
        requestVC.contact = contact
        self.show(requestVC, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
}
