//
//  FirstViewController.swift
//  To Do List
//
//  Created by Patrick Landin on 12/14/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit

var toDoItems : [String] = []

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var toDoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
//    override func viewWillAppear(animated: Bool) {
//        
//        if var storedToDoItems : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDo") {
//            
//            toDoItems = []
//            
//            for var i = 0; i < storedToDoItems.count; ++i {
//                
//                toDoItems.append(storedToDoItems[i] as NSString)
//            }
//        }
//        
//        toDoTable.reloadData()
//    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCellWithIdentifier("TODO_ITEM", forIndexPath: indexPath) as UITableViewCell
        
        //var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "TODO_ITEM")
        // Rob Percival's way of defining cell
        
        cell.textLabel?.text = toDoItems[indexPath.row]
        
        return cell
    }

}

