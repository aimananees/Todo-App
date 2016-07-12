//
//  DetailViewViewController.swift
//  Todo
//
//  Created by Aiman Abdullah Anees on 22/06/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit

class DetailViewViewController: UIViewController {

    @IBOutlet var TitleBox: UITextField!
    
    @IBOutlet var NoteBox: UITextView!
    
    var ViaSegue1 = ""
    var ViaSegue2 = ""
    var EmailInfo = ""
    
    
    
    
    
    @IBAction func BackButton(sender: UIBarButtonItem) {
        
        
        
        
        let ProtectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("MasterTableViewController") as! MasterTableViewController
        
        let Protected = UINavigationController(rootViewController: ProtectedPage)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = Protected
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Detailview "+self.EmailInfo)
        TitleBox.text = ViaSegue1
        NoteBox.text = ViaSegue2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
