//
//  RequestsViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let paul = User(firstName: "Unwrap Issue", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)
    let kevin = User(firstName: "Kevin", lastName: "Judge", company: "Drop", position: "CEO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)
    let alli    = User(firstName: "Alli", lastName: "Judge", company: "Drop", position: "CEO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!)
    
    
    

    var user: User? = nil
    @IBOutlet weak var tableView: UITableView!
    var getRequests: [Request] = []
    let section: [String] = ["Received Requests:", "Expired Requests:"]
    var requests: [[Request]] = [[],[]]// first array will be recieved requests, second array will be sent expired requests
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dictionary: [String : Any] = [
            "toUser" : user ?? paul,
            "fromUser" : kevin,
            "isActive" : true
        ]
        
        let dictionary1: [String : Any] = [
            "toUser" : alli,
            "fromUser" : user ?? paul,
            "isActive" : false
        ]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
        getRequests.append(Request(data: dictionary)!)
        getRequests.append(Request(data: dictionary1)!)
        
        for request in getRequests{
            if request.toUser == user{
                requests[0].append(request)
            } else if request.isActive == false{
                requests[1].append(request)
            }
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            //send to reject/accept page
        } else {
            //send to reactivate page
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.requests[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath)
        
        let request = self.requests[indexPath.section][indexPath.row]
        
        if indexPath.section == 0{
            cell.textLabel?.text = request.fromUser.fullName
        } else {
            cell.textLabel?.text = request.toUser.fullName

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return self.section[section]
        } else {
            return self.section[section]
        }
    }

}