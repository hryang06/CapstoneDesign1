//
//  CafeInfoViewController.swift
//  WoojumunjiCafe
//
//  Created by hryang on 2020/06/10.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import UIKit

protocol CafeInfoViewControllerDelegate: class {
    @available(iOS 13.0, *)
    func cafeInfoViewController(_ controller: CafeInfoViewController, didFinishAdding item: Cafe)
}

class CafeInfoViewController: UIViewController {
    weak var delegate: CafeInfoViewControllerDelegate?
    var infoItem: Cafe?
    
    @IBOutlet weak var content: UILabel?
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var urlLabel: UIButton!
    
    var urlString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let infoItem = infoItem {
            //title = "Edit Item"
            content?.text = infoItem.name
            addressLabel?.text = infoItem.address
            phoneLabel?.text = infoItem.phone
            urlLabel?.setTitle(infoItem.url, for: .normal)
            
            urlString = infoItem.url
        }
    }
    
    @IBAction func openURL() {
        print("url : " + urlString)
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
