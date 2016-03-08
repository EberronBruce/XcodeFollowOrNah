//
//  SelectAccountViewController.swift
//  FollowOrNah
//
//  Created by Bruce Burgess on 3/8/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit
import Accounts
import Social

class SelectAccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Connect Table View to code
    @IBOutlet weak var tableView: UITableView!
    
    //the array of accounts
    var accounts = [ACAccount]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set this view controller as the table view delegate and source
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    //Set the number of rows equal to the number of accounts
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accounts.count
    }
    //Set the label of each row to the corresponding account name
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let account = self.accounts[indexPath.row]
        cell.textLabel!.text = account.username
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let account = self.accounts[indexPath.row]
        let navigationVC = self.presentingViewController as! UINavigationController //get the navigation contoller
        let signInVC = navigationVC.viewControllers[0] as! SignInViewController //get the SignInViewController as a constant
        //Dismiss the view controller and send the account back
        self.dismissViewControllerAnimated(true) { () -> Void in
            signInVC.moveToViewControllerWithAccount(account)
        }
    }


}
