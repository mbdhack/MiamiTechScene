//
//  TableViewViewController.swift
//  MiamiTechScene
//
//  Created by davyngoma on 12/2/16.
//  Copyright © 2016 davyngoma. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate{
    enum SectionName {
        case Bootcamp
        case Education
    }
    var enumAcess = SectionName.Bootcamp
    var instance = BaseClass(latitude: 0.0, longitude: 0.0)
    
      override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.purple
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Tableview Data Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    }
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) 
        switch enumAcess {
        case .Bootcamp:
            cell.textLabel?.text = "BootCamp"
            
        case .Education:
            cell.textLabel?.text =  "Education"
            
        default: break
    }
        
        return cell
    }

    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return instance.section
//    }
//    
    
    
}
