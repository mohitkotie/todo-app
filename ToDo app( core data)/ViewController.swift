//
//  ViewController.swift
//  ToDo app( core data)
//
//  Created by mohit kotie on 28/06/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    
    var tasks : [Task] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print("no")
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // get the data from coredata
        getdata()
        
        // reload the data
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActionTableViewCell
        
        let task = tasks[indexPath.row]
        
        if task.isimportant{
            cell.textLabel?.text = "⭐️\(task.name!)"
        }else{
            cell.textLabel?.text = task.name!
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
         let index = indexPath.row
         tasks[index].complete = true
          appDelegate.saveContext()
        
        do{
            tasks = try context.fetch(Task.fetchRequest())
           
        }
        catch{
            
            print("unabletofetch")
        }


    
    }
    
    
    func getdata(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        do{
            tasks = try context.fetch(Task.fetchRequest())
            
        }
        catch{
            
            print("featching failed")
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
    
        
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            let task = tasks[indexPath.row]
            context.delete(task)
            appDelegate.saveContext()
            
            do{
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch{
                
                print("unabletofetch")
            }
        }
        tableView.reloadData()
        
    }
    
    
    
    @IBAction func completeList(_ sender: UIBarButtonItem) {
        
        let taskcomplete = tasks.filter(
        {
            (tasks) -> Bool in
            
            if tasks.complete == true {
                return true
            } else {
                return false
            }
            
        })
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "list") as! listViewController
        vc.list = taskcomplete
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @IBAction func incompleteList(_ sender: UIBarButtonItem) {
        
        let taskincomplete = tasks.filter(
        {
            (tasks) -> Bool in
            
            if tasks.complete == false{
                return true
            } else {
                return false
            }
            
        })
        
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "list") as! listViewController
        vc.list = taskincomplete
        navigationController?.pushViewController(vc, animated: true)

        
    }
    
    
    
}


