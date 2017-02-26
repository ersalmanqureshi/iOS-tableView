//
//  ViewController.swift
//  SQTableView
//
//  Created by Salman Qureshi on 2/26/17.
//  Copyright © 2017 Salman Qureshi. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var arrayOfItems = ["Item 1","Item 2","Item 3"]
    
    //MARK: ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MAR: UITableView Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.itemLabel.text = arrayOfItems[indexPath.row]
        cell.myTableViewController = self
        return cell
    }
    
    func delete(cell: UITableViewCell) {
        if let deleteIndexPath = tableView.indexPath(for: cell){
            arrayOfItems.remove(at: deleteIndexPath.row)
            tableView.deleteRows(at: [deleteIndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    @IBAction func insertItem(_ sender: UIBarButtonItem) {
        
        arrayOfItems.append("Item \(arrayOfItems.count + 1)")
        
        let insertIndexPath = NSIndexPath(row: arrayOfItems.count - 1, section: 0)
        tableView.insertRows(at: [insertIndexPath as IndexPath], with: .automatic)
    }
    
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let moveIndexPath = arrayOfItems.remove(at: sourceIndexPath.row)
        arrayOfItems.insert(moveIndexPath, at: destinationIndexPath.row)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

