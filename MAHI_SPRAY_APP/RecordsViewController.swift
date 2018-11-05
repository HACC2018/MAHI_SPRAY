//
//  recordsViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/3/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit
import Firebase

var farms : [Mahi] = []

class Mahi {
    // Properties
    var name: String
    var yearApplied: Int
    var address: String
    
    init(name: String, address: String, yearApplied: Int) {
        // Initialize stored properties
        self.name = name
        self.address = address
        self.yearApplied = yearApplied
    }
    
}

class RecordsViewController: UITableViewController {
    
    var ref: DatabaseReference!
    var lotsRef: DatabaseReference!
    var handle: DatabaseHandle!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        ref = Database.database().reference()
//        lotsRef = Database.database().reference().child("Lots")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    var ordered : [Int] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var allYears : [Int] = []
        
        for year in farms {
            allYears.append(year.yearApplied)
        }
        
        ordered = Array(allYears)
        
        return ordered.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yearCell", for: indexPath)
        
        cell.textLabel?.text = "\(ordered[indexPath.row])"

        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
