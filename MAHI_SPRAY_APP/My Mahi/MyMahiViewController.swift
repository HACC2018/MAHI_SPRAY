//
//  MyMahiViewController.swift
//  MAHI_SPRAY_APP
//
//  Created by Jaron Schreiber on 11/3/18.
//  Copyright © 2018 HACC. All rights reserved.
//

import UIKit

protocol addMahiDelegate: class {
    func hideToolbar(isHidden: Bool)
}

class MyMahiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, addMahiDelegate, mahiDetailDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var viewForHeader: UIView!
    var mahiBGImage: UIImage = UIImage(named: "taro_background")!
    
    var mahiLotNameVar: String = ""
    
    var mahiLotAddVar: String = ""
    
    
    //UIBlurEffect
    let visualEffectView = UIVisualEffectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.tableView.contentInset.top = 20.0
        
        navBarheight = self.navigationController?.navigationBar.frame.height ?? 0
        
        //Blur Behind Add Mahi Segue
        visualEffectView.effect = nil
        visualEffectView.frame = self.view.bounds
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
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.text = "Nothing to refresh here!"
        label.sizeToFit()
        label.frame = CGRect(x: 0, y: 75, width: label.frame.width, height: label.frame.height)
        label.center.x = self.view.center.x
        label.layer.opacity = 0.0
        blueView.addSubview(label)
        
        self.blueView.layer.opacity = 0.0
        UIApplication.shared.keyWindow?.addSubview(self.blueView)
        
        if isHidden == true {
            self.tableView.reloadData()
            UIView.animate(withDuration: 0.3) {
                self.blueView.layer.opacity = 0.0
            }
            blueView.removeFromSuperview()
        }
            
        else if isHidden == false {
            UIView.animate(withDuration: 0.3) {
                self.blueView.layer.opacity = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                label.layer.opacity = 1.0
            }
        }
    }

    // MARK: - Table view data source
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell")
//        headerView.addSubview(headerCell!)
//        return headerView
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
        
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 55
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return farms.count + 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row > 0 && indexPath.row < tableView.numberOfRows(inSection: 0) - 1 {
            return 200
        }
            
        if indexPath.row == 0 {
            return 55
        }
        
        else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == farms.count + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
            
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "farmCell", for: indexPath) as? farmLotTableViewCell
            
            cell?.selectionStyle = .none
            
            if let farmCellExists = cell {
                farmCellExists.farmLotNameLabel?.text = farms[indexPath.row-1].name
                farmCellExists.farmLotAddressLabel.text = farms[indexPath.row-1].address
                farmCellExists.backgroundImage.image = farms[indexPath.row-1].image
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
            hideToolbar(isHidden: false)
            
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addMahiController") as? AddMahiPopUpController {
                vc.delegate = self
                self.present(vc, animated: true, completion: nil)
            }
        }
        
        else {
            mahiLotNameVar = farms[indexPath.row-1].name
            mahiLotAddVar = farms[indexPath.row-1].address
            mahiBGImage = farms[indexPath.row-1].image
            
            hideToolbar(isHidden: false)
        
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mahiLot") as?    MahiLotDetailViewController {
                vc.delegate = self
                vc.delegate2 = self
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    // Override to support conditional editing of the table view.
    //    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        // Return false if you do not want the specified item to be editable.
    //        return true
    //    }
    
    
    
    // Override to support editing the table view.
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            farms.remove(at: indexPath.row)
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //        } else if editingStyle == .insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //        }
    //    }
    
    
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
