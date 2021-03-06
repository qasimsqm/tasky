/*
 FirstViewController.swift
 Tasky
 Created by Syed Qasim  on 4/4/17.
 Copyright © 2017 Origamistudio. All rights reserved.
 */

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
    
{
    
    
    @IBOutlet var tblTasks : UITableView!
    
    //For persisting data
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblTasks.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tblTasks.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
        
    }
    
    //Define how our cells look - 2 lines a heading and a subtitle
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Default Tasks")
        
        //Assign the contents of our var "items" to the textLabel of each cell
        cell.textLabel!.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel!.text = taskMgr.tasks[indexPath.row].description
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if (editingStyle == UITableViewCell.EditingStyle.delete){
            
            taskMgr.removeTask(indexPath.row)
            tblTasks.reloadData()
        }
        
    }
    
}


