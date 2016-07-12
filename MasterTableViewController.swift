//
//  MasterTableViewController.swift
//  Todo
//
//  Created by Aiman Abdullah Anees on 22/06/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import SwiftyJSON
import Alamofire
import CoreData





class MasterTableViewController: UITableViewController{
    
    var NoOfRows = 0
    var NamesArray = [String]()
    var NotesArray = [String]()
    var jsonArray:NSMutableArray = []
    var newArray = [String]()
    var DetailArray = [String]()
    var IDArray = [String]()
    

    
    
    
    
    
    

    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
       // parseJSON()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    
    
       
    func DownloadAndUpdate()
    {
        
        DetailArray = []
        IDArray = []
        NotesArray = []
        
        
        Alamofire.request(.GET, "http://127.0.0.1:5000/todo/api/v1.0/tasks") .responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                
                print(JSON)
                
                print("http://127.0.0.1:5000/todo/api/v1.0/")
                
               for item in JSON["tasks"] as! [AnyObject]
                {
                    let text = item["title"] as! String
                    let text1 = item["description"] as! String
                    let text2 = item["uri"] as! String
                    let text3 = text2.componentsSeparatedByString("/")
                    let text4 = text3[7]
                    
                    self.DetailArray.append(text)
                    self.NotesArray.append(text1)
                    self.IDArray.append(String(text4))
                   
                }
                
                print(self.DetailArray)
                
            
                self.tableView.reloadData()
            }
        }
    }
    
    
        override func viewWillAppear(animated: Bool) {
        self.DownloadAndUpdate()
    }
    
    
        
    
    
    
    func DeleteJSON(id:String)
    {
        let firstTodoEndpoint: String = "http://127.0.0.1:5000/todo/api/v1.0/tasks/\(id)"
        
        Alamofire.request(.DELETE, firstTodoEndpoint)
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling DELETE on /todos/1")
                    print(response.result.error!)
                    return
                }
                print("DELETE ok")
        }
    }




 
        
        
    @IBAction func LogOutButton(sender: UIBarButtonItem) {
        let LoginManager = FBSDKLoginManager()
        
        LoginManager.logOut()
        //To Move Back To Login Page(Same code as written in ViewController Class
        
        let ProtectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        let Protected = UINavigationController(rootViewController: ProtectedPage)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = Protected
        
        
    }
    

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DetailArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = DetailArray[indexPath.row]
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //To Add Checkmark in Todo
        let SelectedRow:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if SelectedRow.accessoryType == UITableViewCellAccessoryType.None
        {
            SelectedRow.accessoryType = UITableViewCellAccessoryType.Checkmark
            SelectedRow.tintColor = UIColor.grayColor()
        }
        else{
            SelectedRow.accessoryType = UITableViewCellAccessoryType.None
        }
        //To move to Details Page
        
        let Title = DetailArray[indexPath.row]
        let Note = NotesArray[indexPath.row]
        
        var DetailVC : DetailViewViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewViewController") as! DetailViewViewController
        
        DetailVC.ViaSegue1 = DetailArray[indexPath.row]
        DetailVC.ViaSegue2 = NotesArray[indexPath.row]
        
        self.presentViewController(DetailVC, animated: true, completion: nil)
        
        
    }

    

    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let deletedrow:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        if editingStyle == UITableViewCellEditingStyle.Delete {
            DeleteJSON(IDArray[indexPath.row])
            DetailArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            self.DownloadAndUpdate()
        }
    }
 
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
