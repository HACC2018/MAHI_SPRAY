//
//  recordsViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/3/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit
import Firebase

class Mahi {
    // Properties
    var name: String
    var pesticide: String
    
    init(name: String, pesticide: String) {
        // Initialize stored properties
        self.name = name
        self.pesticide = pesticide
    }
    
}

class RecordsViewController: UITableViewController {
    
    var ref: DatabaseReference!
    var lotsRef: DatabaseReference!
    var handle: DatabaseHandle!
    
    var farms : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("anything")
        
        ref = Database.database().reference()
        lotsRef = Database.database().reference().child("Lots")
        
        //let childRef = Database.database().reference(withPath: "Products")
        
        // 3
        //let itemsRef = ref.child("")
        
        //let userID = Auth.auth().currentUser?.uid
        
        //        ref.observe(.value, with: { snapshot in
        //
        //            for child in snapshot.children {
        //                if let snapshot = child as? String,
        //                    let groceryItem = Mahi(name: snapshot) {
        //                    farms.append(groceryItem)
        //                }
        //            }
        //            print(snapshot.value as Any)
        //        })
        
        handle = lotsRef?.queryOrdered(byChild: "Farm1").queryEqual(toValue: 0).observe(.childAdded, with: { (snapshot) in
            let pesticide = snapshot.value as? String
            
            if let actualPesticide = pesticide {
                
                self.farms.append(actualPesticide)
                self.tableView.reloadData()
                print("hello? gggggg")
            }
        } )
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return farms.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "farmCell", for: indexPath)
        cell.textLabel?.text = farms[indexPath.row]
        
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
