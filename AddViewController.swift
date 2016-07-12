//
//  AddViewController.swift
//  Todo
//
//  Created by Aiman Abdullah Anees on 23/06/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class AddViewController: UIViewController {

    
    @IBOutlet var TitleBox: UITextField!
    
    @IBOutlet var MessageBox: UITextView!
    
    
    
    @IBAction func Done(sender: UIBarButtonItem) {
        Alamofire.request(.POST, "http://127.0.0.1:5000/todo/api/v1.0/tasks", parameters: ["title": self.TitleBox.text!,"description":self.MessageBox.text!], encoding: .JSON)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
