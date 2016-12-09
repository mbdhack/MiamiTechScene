//
//  TableViewViewController.swift
//  MiamiTechScene
//
//  Created by davyngoma on 12/2/16.
//  Copyright © 2016 davyngoma. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate {
//    enum SectionName {
//        case Bootcamp
//        case Education
//    }
    //var  holder = [String]()
    var  test = ["gert","gert","gert","gert"]
    var testimage = ["annotation_pin"]
   // var enumAcess = SectionName.Bootcamp
    var instance3 = BaseClass(latitude: 0.0, longitude: 0.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.purple
        //fecthData ()
        
        print(instance3.education)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Tableview Data Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return test.count
    }
    
//    func fecthData (){
//        for item in instance3.sectionsArray{
//           // holder = [item.name]
//        }
//    }
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
    
        let holder_city = test[indexPath.row]
        cell.schoolNameLAbel.text = holder_city
        cell.imageview.image = UIImage(named:"annotation_pin")
    
        return cell
    }
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return instance.section
//    }
//    
    
}
