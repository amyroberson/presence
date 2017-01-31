//
//  RequestsViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var user: User? = nil
    @IBOutlet weak var tableView: UITableView!
    var getRequests: [Request] = []
    let section: [String] = ["Received Requests:", "Send Requests", "Expired Requests:"]
    var requests: [[Request]] = [[],[], []]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dictionary: [String : Any] = [:]
        
        do{
            let data = try Util.toJson(dictionary: dictionary)
            let requestStore = RequestStore(endpoint: .getRequestsForUser)
            
            requestStore.fetchRequestsForUser(json: data, completion: { result in
                switch result{
                case .success(let requests):
                    self.getRequests = requests
                case .failure(let resource):
                    print(resource)
                default:
                    break
                }
            })
        } catch {
             print("toJson Error")
        }
        
        tableView.separatorStyle = .none

        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
        
        for request in getRequests{
            if request.toUser == user{
                requests[0].append(request)
            } else if request.isActive == false{
                requests[2].append(request)
            } else {
                requests[1].append(request)
            }
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            let acceptRejectVC = storyBoard.instantiateViewController(withIdentifier: "AcceptReject") as! AcceptRejectViewController
                        acceptRejectVC.contact = requests[indexPath.section][indexPath.row].fromUser
            acceptRejectVC.request = requests[indexPath.section][indexPath.row]
            self.show(acceptRejectVC, sender: nil)
            
        } else if indexPath.section == 2{
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            let reactivateVC = storyBoard.instantiateViewController(withIdentifier: "Reactivate") as! ReactivateRequestViewController
                reactivateVC.contact = requests[indexPath.section][indexPath.row].toUser
                reactivateVC.request = requests[indexPath.section][indexPath.row]
            self.show(reactivateVC, sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.requests[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! RequestCell
        
        let request = self.requests[indexPath.section][indexPath.row]
        
        if indexPath.section == 0{
            cell.userLabel?.text = request.fromUser.fullName
        } else if indexPath.section == 1{
            cell.userLabel?.text = request.toUser.fullName
        } else {
            cell.userLabel?.text = request.toUser.fullName
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

}
