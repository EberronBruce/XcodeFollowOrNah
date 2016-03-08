//
//  DecideViewController.swift
//  FollowOrNah
//
//  Created by Bruce Burgess on 3/8/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit
import Accounts
import Social

class DecideViewController: UIViewController {
    
    var account : ACAccount?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        getFollowingCount()
    }
    
    //function used to get the Twitter Following accoung
    func getFollowingCount() {
        //stores the URL for the verify account provided by Twiiter - https://dev.twitter.com/rest/reference/get/account/verify_credentials
        let verifyAccountURL = NSURL(string: "https://api.twitter.com/1.1/account/verify_credentials.json")
        //Create a request constant for the twitter api
        let verifyAccountRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: verifyAccountURL, parameters: nil)
        //set the requested account to the selected acount
        verifyAccountRequest.account = self.account!
        //Make the API call to Twitter
        verifyAccountRequest.performRequestWithHandler { (data :NSData!, response :NSHTTPURLResponse!, error :NSError!) -> Void in
            //If no error do this
            if error == nil {
                print("Roll Tide")
                
            } else { //If an error happens
                print("We got a problem")
                print(error)
            }
        }
    }
 

}
