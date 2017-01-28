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
    
    var contacts: [User] = [User(firstName: "Ann", lastName: "Judge", company: "DropBox", position: "CTO", email: "Ann@drop.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!), User(firstName: "Paul", lastName: "Smith", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)]
    var user: User? = nil
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        
        //post request for users contacts
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func tableView(_ sender: UITableView, numberOfRowsInSection: Int) -> Int{
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactView") as! ContactViewController
        contactVC.contact = contact
        self.show(contactVC, sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].firstName
        return cell
    }
}
