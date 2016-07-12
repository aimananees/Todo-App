//
//  ViewController.swift
//  Todo
//
//  Created by Aiman Abdullah Anees on 21/06/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import CoreData



class ViewController: UIViewController,FBSDKLoginButtonDelegate {
    

    @IBOutlet var LoginButton: FBSDKLoginButton!
    
    var email:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LoginButton.delegate = self
        let email = LoginButton.readPermissions = ["public_profile","email","user_friends"]
        
       
        

    }
    
    //Will take the user to protected page when the user is already logged-in
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if(FBSDKAccessToken.currentAccessToken() != nil)
        {
            let ProtectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("MasterTableViewController") as! MasterTableViewController
            
            let Protected = UINavigationController(rootViewController: ProtectedPage)
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = Protected
            
            
            
            
            
        }
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    internal func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if (error != nil)
        {
            print(error.localizedDescription)
            return
        }
        if result.token != nil
        {
            let token:FBSDKAccessToken = result.token
            
            let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: result.token.tokenString, version: nil, HTTPMethod: "GET")
            req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
                if(error == nil)
                {
                    
                    self.email = result["email"] as! String
                    
                    
                        
                        
                        
                                       }
                    
                    
                    
               

            let ProtectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("MasterTableViewController") as! MasterTableViewController
            
            let Protected = UINavigationController(rootViewController: ProtectedPage)
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = Protected
            
            
        
        
            })
        }
    }
    
    
    
    //Passing Email info to MasterTableViewController
       
    
    
    internal func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        print("Log Out")
        
    }
    
    
    //Fetch Facebook INFO...
    

}

