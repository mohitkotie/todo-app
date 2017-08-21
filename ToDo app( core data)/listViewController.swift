//
//  listViewController.swift
//  ToDo app( core data)
//
//  Created by mohit kotie on 29/06/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit

class listViewController: UIViewController,UITableViewDelegate , UITableViewDataSource{
    var list :[Task] = []
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.delegate = self
        listTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        
        cell?.textLabel?.text = list[indexPath.row].name
        
        return cell!
        
    }

    
}
