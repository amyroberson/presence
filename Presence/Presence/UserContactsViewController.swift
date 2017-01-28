//
//  UserContactsViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/27/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class UserContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var contacts: [User] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ sender: UITableView, numberOfRowsInSection: Int) -> Int{
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let event = events[indexPath.row]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].firstName
        return cell
    }
}
