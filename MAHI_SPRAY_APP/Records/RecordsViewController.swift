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

class RecordsViewController: UITableViewController, mahiRecordsDelegate {
    
    var ref: DatabaseReference!
    var lotsRef: DatabaseReference!
    var handle: DatabaseHandle!
    
    override func viewWillAppear(_ animated: Bool) {
        
        //var allYears : [Int] = []
        
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
    
    var ordered : [String] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        ordered.removeAll()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        
        for time in farms {
            
            let nameOfMonth = dateFormatter.string(from: time.dateApplied)
            
            ordered.append(nameOfMonth)
        }
        
        //ordered = Array(allYears)
        ordered.sort()
        
        return ordered.count
    }
    
    var mahiDate: [Date] = []
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yearCell", for: indexPath)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        
        cell.textLabel?.text = "\(dateFormatter.string(from: farms[indexPath.row].dateApplied))"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "yearCell", for: indexPath)
        
//        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mahiInYearSelected") as? mahiInYearSelectedViewController {
//            self.present(vc, animated: false, completion: nil)
//            vc.delegate = self
//            mahiDate.append(farms[indexPath.row].dateApplied)
//        }
        
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
