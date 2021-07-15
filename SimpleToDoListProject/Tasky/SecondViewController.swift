/*
 SecondViewController.swift
 Tasky
 Created by Syed Qasim  on 4/4/17.
 Copyright © 2017 Origamistudio. All rights reserved.
 */

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Button Clicked
    @IBAction func btnAddTask(_ sender : UIButton){
        if (txtTask.text == ""){
            //Task Title is blank, do not add a record
        } else {
            //add record
            let name: String = txtTask.text!
            let description: String = txtDesc.text!
            taskMgr.addTask(name, desc: description)
            
            //dismiss keyboard and reset fields
            
            self.view.endEditing(true)
            txtTask.text = nil
            txtDesc.text = nil
            
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
}


