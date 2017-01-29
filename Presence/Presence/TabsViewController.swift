//
//  TabsViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class TabsViewController: UITabBarController {
    
    var user: User? = (User(firstName: "Lilly", lastName: "Judge", company: "PinDrop", position: "CTO", email: "Paul@Pin.com", password: "notThis", showImage: true, image: UIImage(named: "synthwave")!))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in self.viewControllers!{
            if let controller = item as? UINavigationController{
                if let eventsVC = controller.topViewController as? EventsViewController{
                    eventsVC.user = user
                } else if let contactsVC = controller.topViewController as? UserContactsViewController{
                    contactsVC.user = user
                } else if let requestVC = controller.topViewController as? RequestsViewController{
                    requestVC.user = user
                }
            }
            else if let controller = item as? ProfileViewController{
                controller.user = user
            }
            
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
