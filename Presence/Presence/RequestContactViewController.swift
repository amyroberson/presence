//
//  RequestContactViewController.swift
//  Presence
//
//  Created by Amy Roberson on 1/28/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class RequestContactViewController: UIViewController {

    var user: User? = nil
    var contact: User? = nil
    var success: Bool = false
    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var contactNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        contactNameLabel.text = contact?.fullName
        if contact?.showImage == false{
            contactImage.isHidden = true
        } else {
        contactImage.image = contact?.image
        }
    }

    
    @IBAction func requestButtonPressed(_ sender: UIButton) {
        let  dictionary: [String: Any] = [:]
        
        do{
            let data = try Util.toJson(dictionary: dictionary)
            RequestStore(endpoint: .createRequest).postCreateRequest(json: data, completion: { result in
                switch result {
                case .success:
                    self.success = true
                case .failure( let resource):
                    print(resource)
                default:
                    print("unexpected data returned")
                }
            })
        } catch {
            print("to Json Error")
        }
        
        if success {
            let arrayCount: Int = Int((navigationController?.viewControllers.count)!)
            if arrayCount >= 2 {
                let uiVC: UIViewController = (navigationController?.viewControllers[arrayCount - 2])!
                let _ = self.navigationController?.popToViewController(uiVC, animated: true)
            }
        } else {
            print("error creating a request")
        }
        
    }

}
