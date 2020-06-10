//
//  TableViewController.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/05/06.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {
    var ref: DatabaseReference!
    var dummyCafeList = [Cafe]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.dummyCafeList.append(Cafe(name: "cafe_test"))
        
        for idx in Range(0...9) {
            let root = "data/" + String(idx)
            ref = Database.database().reference()
            ref.child(root).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                let cafename = value?["place_name"] as? String ?? ""
                //print(cafename)
                let cafe = Cafe(name: cafename)
                print(cafe.name)
                self.dummyCafeList.append(cafe)
                print(self.dummyCafeList.count)
            })
        }
        //{ (error) in
        //    print(error.localizedDescription)
        //}
        print("here")
        print(self.dummyCafeList.count)
        //self.loadView()
        //Cafe.loadCafe()
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
 */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return 30
        return self.dummyCafeList.count
    }

    // 가장 중요한 메소드.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let target  = self.dummyCafeList[indexPath.row]
        cell.textLabel?.text = target.name
        cell.detailTextLabel?.text = target.price.description

        /*
        let root = "data/" + String(indexPath.row)
        ref = Database.database().reference()
        ref.child(root).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let cafename = value?["place_name"] as? String ?? ""
            cell.textLabel?.text = cafename
            //print(cafename)
            let cafe = Cafe(name: cafename)
            //print(cafe.name)
            self.dummyCafeList.append(cafe)
            //print(self.dummyCafeList[0].name)
        })
        print(self.dummyCafeList.count)*/
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
