//
//  SecondViewController.swift
//  To Do List
//
//  Created by Patrick Landin on 12/14/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addItemText: UITextField!
    
    @IBAction func AddItemPressed(sender: AnyObject) {
        
        toDoItems.append(addItemText.text)
        
        let fixedToDoItems = toDoItems
        NSUserDefaults.standardUserDefaults().setObject(fixedToDoItems, forKey: "toDo")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }


}

