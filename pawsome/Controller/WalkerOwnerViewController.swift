//
//  WalkerOwnerViewController.swift
//  pawsome
//
//  Created by Roch on 29/03/2022.
//

import UIKit

class WalkerOwnerViewController: UIViewController {
    
    let ownerService = OwnerService()
    var ownerList = [Owner]()
    var postedRequests = [RequestPost]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ownerService.getAllOwner(){ success, messsage, data in
            if success {
                self.ownerList = data
                print("owner2 ====> ", self.ownerList)
                self.getPostedRequest()
            }
        }
        print("owner ====> ", ownerList)
    }
    

    
    // MARK: General Functions
    func getPostedRequest(){
        ownerService.getAllRequestPosts(){success, message, data in
            if success {
                
                self.postedRequests = data
                
                for (index,_) in self.postedRequests.enumerated() {
                    self.postedRequests[index].userName = self.ownerList.first(where: {$0._id == self.postedRequests[index].userId})?.fullName ?? ""
                }
            }
        }
    }

}
