//
//  TableViewViewController.swift
//  MiamiTechScene
//
//  Created by davyngoma on 12/2/16.
//  Copyright © 2016 davyngoma. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {
    var instance = BaseClass(latitude: 0.0, longitude: 0.0)
    
      override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.purple
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Tableview Data Delegate
    
    
    
}
