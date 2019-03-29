//
//  ConfirmViewController.swift
//  TNCRM_IPAD
//
//  Created by brandon on 3/29/19.
//  Copyright © 2019 Brandon Nguyen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ConfirmViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var checkInButton: UIButton!
    
    let ref = Database.database().reference(withPath: "Customers")
    let cellId = "customCell"
    var customersArray = [String]()
    var count = 1
    
    override func viewDidLoad() {
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // TODO Count resets when app closes
    @IBAction func pressButton(_ sender: Any) {
        let name = nameInput.text
        ref.childByAutoId().setValue(["Name":name, "Service":"None"])
    }
    
}
