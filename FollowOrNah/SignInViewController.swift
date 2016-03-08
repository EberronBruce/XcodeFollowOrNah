//
//  ViewController.swift
//  FollowOrNah
//
//  Created by Bruce Burgess on 3/7/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit
import Accounts
import Social

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func signInTapped(sender: AnyObject) {
        //Setting up for permission to access twitter account
        let account = ACAccountStore()
        //Pop up and asking for twitter usage
        let accountTypeTwitter = account.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        account.requestAccessToAccountsWithType(accountTypeTwitter, options: nil) { (granted :Bool, error : NSError!) -> Void in
            //If accepted...
            if granted {
                let allAccounts = account.accountsWithAccountType(accountTypeTwitter)
                if allAccounts.count <= 0 {
                    print("No Accounts")
                } else if allAccounts.count == 1 {
                    print("They only have one, let's use it")
                } else {
                    print("They have more than one, so lets ask which one they want to use")
                    //Use to prevent issues with thread..
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.performSegueWithIdentifier("chooseAccountSegue", sender: allAccounts)
                    })
                    
                }
            } else {
                print("It Didn't work BRAH!")
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chooseAccountSegue" {
            let selectVC = segue.destinationViewController as! SelectAccountViewController
            selectVC.accounts = sender as! [ACAccount]
        }
    }
    
    func moveToViewControllerWithAccount(account: ACAccount) {
        print("You made it")
    }

}

