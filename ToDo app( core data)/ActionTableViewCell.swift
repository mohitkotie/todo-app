//
//  ActionTableViewCell.swift
//  ToDo app( core data)
//
//  Created by mohit kotie on 28/06/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit

class ActionTableViewCell: UITableViewCell {

    @IBOutlet weak var iscomplete: UIButton!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    @IBAction open func comButTapped(_ sender: UIButton?) {
        
        
        iscomplete.setTitle("✔︎",for: .normal)
    

}
}
