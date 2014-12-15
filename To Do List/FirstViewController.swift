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
        
    }  // Amount of cells in tableView
    
    
    override func viewWillAppear(animated: Bool) {
        
        if var storedToDoItems : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDo") {
            
            toDoItems = []
            
            for var i = 0; i < storedToDoItems.count; ++i {
                
                toDoItems.append(storedToDoItems[i] as NSString)
            }
        }
        
        toDoTable.reloadData()
        
    }  // Check to see if new things have been saved to array, set array to nil, then loop through array and replenish.
       // Runs every time we click for the tableView to appear again (different from ViewDidLoad).
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoItems.removeAtIndex(indexPath.row)
            
            let fixedToDoItems = toDoItems
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoItems, forKey: "toDo")
            NSUserDefaults.standardUserDefaults().synchronize()

            toDoTable.reloadData()
        }
        
    }  //  If user is deleting something, remove that item at its indexPath. Save everything using NSUserDefaults again.
       //  Could have created a function for NSUserDefaults instead of copying it from SecondViewController
       //  Reload table again.
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCellWithIdentifier("TODO_ITEM", forIndexPath: indexPath) as UITableViewCell
        
        // var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "TODO_ITEM")
        // Rob Percival's shhhtupid way of creating a default cell.
        
        cell.textLabel?.text = toDoItems[indexPath.row]
        
        return cell
        
    }  //  Filling a default cell with text.
    

} //  class ViewController

