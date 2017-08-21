//
//  AddTaskViewController.swift
//  ToDo app( core data)
//
//  Created by mohit kotie on 28/06/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var isImp: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnTapped(_ sender: UIButton) {
        
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = textField.text!
        task.isimportant = isImp.isOn
        
        appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
        
        
    }
    

}
