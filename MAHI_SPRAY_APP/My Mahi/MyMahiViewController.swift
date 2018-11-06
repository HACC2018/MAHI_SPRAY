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
    func hideToolbar(isHidden: Bool)
}

class MyMahiViewController: UITableViewController, addMahiDelegate {
    
    //UIBlurEffect
    let visualEffectView = UIVisualEffectView()
    
    @IBOutlet var addMahiButtonOutlet: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarheight = self.navigationController?.navigationBar.frame.height ?? 0
        
        //Blur Behind Add Mahi Segue
        visualEffectView.effect = nil
        visualEffectView.frame = self.view.bounds
        
        farms.append(Mahi(name: "Farm One", address: "111 Kalanui Rd", dateApplied: Date(timeIntervalSince1970: 3000), image: UIImage(named: "taro_background")!, pesticides: [pesticide(pesticideName: "Cyanide")]))
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
    
    //adding gradient behind add mahi popup
    let blueView:UIView = UIView(frame: UIScreen.main.bounds)
    
    func hideToolbar(isHidden: Bool) {
        
        let hueCard = CAGradientLayer()
        hueCard.frame = blueView.bounds
        hueCard.startPoint = CGPoint(x: 0, y: 0)
        hueCard.endPoint = CGPoint(x: 1, y: 1)
        hueCard.colors = [UIColor.init(red: 0.839, green: 0.47, blue: 0.247, alpha: 1.0).cgColor, UIColor.init(red: 0.824, green: 0.255, blue: 0.282, alpha: 1.0).cgColor]

        blueView.layer.addSublayer(hueCard)
        self.blueView.layer.opacity = 0.0
        UIApplication.shared.keyWindow?.addSubview(self.blueView)
        
        
        if isHidden == true {
            self.navigationItem.rightBarButtonItem = self.addMahiButtonOutlet
            
            UIView.animate(withDuration: 0.3) {
                self.blueView.layer.opacity = 0.0
            }
            blueView.removeFromSuperview()
        }
            
        else if isHidden == false {
            
            UIView.animate(withDuration: 0.3) {
                self.blueView.layer.opacity = 1.0
            }
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    @IBAction func addMahiButtonPressed(_ sender: UIBarButtonItem) {
        
        hideToolbar(isHidden: false)
        
        //        if let applicationDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate? {
        //            if let window:UIWindow = applicationDelegate.window {
        //                let blueView:UIView = UIView(frame: UIScreen.main.bounds)
        //                let hueCard = CAGradientLayer()
        //                hueCard.frame = blueView.bounds
        //                hueCard.startPoint = CGPoint(x: 0, y: 0)
        //                hueCard.endPoint = CGPoint(x: 1, y: 1)
        //                hueCard.colors = [UIColor.init(red: 0.839, green: 0.47, blue: 0.247, alpha: 1.0).cgColor, UIColor.init(red: 0.824, green: 0.255, blue: 0.282, alpha: 1.0).cgColor]
        //
        //                blueView.layer.addSublayer(hueCard)
        //                window.addSubview(blueView)
        //            }
        //        }
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addMahiController") as? AddMahiPopUpController {
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
            //            UIView.animate(withDuration: 1.0) {
            //                self.visualEffectView.effect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
            //                self.view.addSubview(self.visualEffectView)
            //            }
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
            farmCellExists.backgroundImage.image = farms[indexPath.row].image
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
