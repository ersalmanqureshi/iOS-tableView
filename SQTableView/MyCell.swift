//
//  MyCell.swift
//  SQTableView
//
//  Created by Salman Qureshi on 2/26/17.
//  Copyright © 2017 Salman Qureshi. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    var myTableViewController: MyTableViewController?
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        deleteButton.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func deleteCell(){
        print("Delete tap")
        myTableViewController?.delete(cell: self)
    }
}
