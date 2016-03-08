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
    
    //Connect label from storyboard to cod
    @IBOutlet weak var friendLabel: UILabel!
    //account property that is selected by the user
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
                //Can throw an error
                do {
                    //Get the JSON information from the API and Store it in a dictonary
                    let responseJSONDictonary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves) as! [String : AnyObject]
                    //print(responseJSONDictonary)
                    let friendCount = responseJSONDictonary["friends_count"] as! Int
                    print(friendCount)
                    
                    self.friendLabel.text = "You are following \(friendCount) accounts"
                } catch {
                    
                }
                
                
            } else { //If an error happens
                print("We got a problem")
                print(error)
            }
        }
    }
 

}
