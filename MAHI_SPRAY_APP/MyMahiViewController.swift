//
//  MyMahiViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/3/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

protocol addMahiDelegate: class {
    func removeBlur()
}

class MyMahiViewController: UITableViewController, addMahiDelegate {
    
    //UIBlurEffect
    let visualEffectView = UIVisualEffectView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Blur Behind Add Mahi Segue
        visualEffectView.effect = nil
        visualEffectView.frame = self.view.bounds
        
        farms.append(Mahi(name: "Farm One", address: "111 Kalanui Rd", yearApplied: 1999))
        farms.append(Mahi(name: "Farm Two", address: "222 Kalanui Rd", yearApplied: 2001))
        tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func removeBlur() {
        self.visualEffectView.effect = nil
        self.visualEffectView.removeFromSuperview()
        self.tableView.reloadData()
    }

    @IBAction func addMahiButtonPressed(_ sender: UIBarButtonItem) {
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addMahiController") as? AddMahiPopUpController {
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
            UIView.animate(withDuration: 1.0) {
                self.visualEffectView.effect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
                self.view.addSubview(self.visualEffectView)
            }
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "farmCell", for: indexPath) as? farmLotTableViewCell
        
//        cell.textLabel?.text = farms[indexPath.row].name
        
        if let farmCellExists = cell {
            farmCellExists.farmLotNameLabel?.text = farms[indexPath.row].name
            farmCellExists.farmLotAddressLabel.text = farms[indexPath.row].address
        }
        
        return cell!
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
