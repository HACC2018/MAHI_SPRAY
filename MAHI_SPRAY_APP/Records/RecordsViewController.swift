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
var mahiMonths : [String] = []

class RecordsViewController: UITableViewController, mahiRecordsDelegate {
    
    var ref: DatabaseReference!
    var lotsRef: DatabaseReference!
    var handle: DatabaseHandle!
    
    var ordered : [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        
        unordered.removeAll()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        
        for time in farms {
            
            let year = dateFormatter.string(from: time.dateApplied)
            
            unordered.append(year)
        }
        
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
    
    var unordered : [String] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        ordered = unordered.removingDuplicates()
        return ordered.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yearCell", for: indexPath) as? yearCell
        
        ordered.sort()
        cell?.yearLabel.text = "\(ordered[indexPath.row])"

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "yearCell", for: indexPath) as! yearCell
        
        //Year Formatter
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "YYYY"
        
        //Month Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        
        for item in farms {
            if ordered[indexPath.row] == dateFormatter2.string(from: item.dateApplied) {
                //mahiMonths.append(dateFormatter.string(from: item.dateApplied))
                mahiMonths.append(dateFormatter.string(from: item.dateApplied))
            }
            else {

            }
        }
        
        print(mahiMonths)
        
//        let addMonthToView2 = dateFormatter2.string(from: farms[indexPath.row].dateApplied)
        
//        let addMonthToView = dateFormatter.string(from: farms[indexPath.row].dateApplied)
//        mahiMonths.append(addMonthToView)
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

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
