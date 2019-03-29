//
//  ViewController.swift
//  TNCRM_IPAD
//
//  Created by brandon on 3/29/19.
//  Copyright © 2019 Brandon Nguyen. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var customerTable: UITableView!
    
    let cellId = "customCell"
    var customersArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customerTable.dataSource = self as? UITableViewDataSource
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.setHidesBackButton(true, animated:true)
        let ref = Database.database().reference(withPath: "Customers")
//
//        ref.observe(.childAdded) { (snapshot) in
//            let cell = self.customerTable.dequeueReusableCell(withIdentifier: self.cellId)
//            let snapshotValue = snapshot.value as! NSDictionary
//            let customerName = snapshotValue["Name"]
////            let serviceName = snapshotValue["Service"]
//            self.customersArray.append(customerName as! String)
//
//            cell?.textLabel?.text = customerName as? String
//
//
//            self.customerTable.reloadData()
//        }
//
//        for i in 0...10 {
//            
//        }
//
        ref.observe(.childAdded) { (snapshot) in
            print("Just added!")
            let snapshotValue = snapshot.value as! NSDictionary
            let customerName = snapshotValue["Name"]
            //            let serviceName = snapshotValue["Service"]
            // TODO Maybe make a customerObject to pass two data...
            self.customersArray.append(customerName as! String)
            self.customerTable.reloadData()
            
        }
        
        ref.observe(.childRemoved) { (snapshot) in
            print("Just removed!")
            let snapshotValue = snapshot.value as! NSDictionary
            let customerName = snapshotValue["Name"]
            let serviceName = snapshotValue["Service"]
            let index = self.customersArray.firstIndex(of: customerName as! String)
            self.customersArray.remove(at: index!)
            self.customerTable.reloadData()
            print("\(customerName):\(serviceName) removed!")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let name = customersArray[indexPath.row]
        cell.textLabel?.text = name
        return cell
    }
    


}

