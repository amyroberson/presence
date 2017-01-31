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
    
    var contacts: [User] = [] {
        didSet{
            refresh()
        }
    }
    var user: User? = nil
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        
        let dictionary: [String: Any] = [:]
        do {
            let data = try Util.toJson(dictionary: dictionary)
            UserPostStore(endpoint:.getContactsForUser).fetchContactsForUser(json: data, completion: ({
                result in
                switch result{
                case .success(let users):
                    if let _users = users as? [User]{
                        self.contacts = _users
                    }
                case .failure(let resource):
                    print(resource)
                default:
                    break
                }
                }
                )
            )
        } catch {
            print("Json Error")
        }
        tableView.separatorStyle = .none
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        cell.contactLabel?.text = contacts[indexPath.row].firstName
        return cell
    }
    
    func refresh(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
