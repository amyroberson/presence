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
            _contacts = _event.contacts
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()

        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttendantCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].fullName
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        // if contact.contacts.contains.user, send to contactViewController
        //else send to requestViewController
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
}
