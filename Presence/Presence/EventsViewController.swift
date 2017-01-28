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
    
    var events: [Event] = []{
        didSet{
            refresh()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = EventStore().fetchEvents(completion: { result in
            switch result{
            case .success(let eventArray):
                self.events = eventArray
            default:
                print("there was an error")}
        })
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ sender: UITableView, numberOfRowsInSection: Int) -> Int{
        return events.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let event = events[indexPath.row]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
            cell.textLabel?.text = events[indexPath.row].name
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
