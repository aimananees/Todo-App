//
//  Sample.swift
//  Todo
//
//  Created by Aiman Abdullah Anees on 01/07/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import Foundation

/*for item in JSON["tasks"] as! [AnyObject]
 {
 let text = item["title"] as! String
 let text1 = item["description"] as! String
 let text2 = item["uri"] as! String
 let text3 = text2.componentsSeparatedByString("/")
 let text4 = text3[7]
 
 self.DetailArray.append(text)
 self.NotesArray.append(text1)
 self.IDArray.append(String(text2))
 
 
 
 
 
 
 
 }
 */

/*func parseJSON()
 {
 let path :String = NSBundle.mainBundle().pathForResource("Todo", ofType: "json")!
 let jsonData = NSData(contentsOfFile: path)
 let readableJSON = JSON(data: jsonData!, options: NSJSONReadingOptions.MutableContainers, error: nil)
 NoOfRows = readableJSON["Todo"].count
 
 
 
 
 for i in 1...NoOfRows
 {
 var Person = "Person"
 Person += "\(i)"
 var Name = readableJSON["Todo"][Person]["title"].string! as String
 var Notes = readableJSON["Todo"][Person]["notes"].string! as String
 
 
 NamesArray.append(Name)
 NotesArray.append(Notes)
 
 
 var name = readableJSON["Todo"]
 NSLog("\(name)")
 
 
 }
 
 
 
 
 
 }
 
 */
/*
 if let dataArray = JSON as? NSArray {
 for item in dataArray as! [NSDictionary]
 {
 let text = item["title"] as! String
 let text1 = item["description"] as! String
 let text2 = item["id"] as! Int
 
 self.DetailArray.append(text)
 self.NotesArray.append(text1)
 self.IDArray.append(String(text2))
 
 }
 
 }
 */


