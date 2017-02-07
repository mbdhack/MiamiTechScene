//
//  TableViewViewController.swift
//  MiamiTechScene
//
//  Created by davyngoma on 12/2/16.
//  Copyright © 2016 davyngoma. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var serachBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
     var enterI = BaseClass(latitude: 0.0, longitude: 0.0)
     var holder2 = [String]()
     var holder3 = [String]()
     var nameSender :  String = ""
     var phoneSender : String = ""
     var websitePass : String = ""
     var descriSender: String = ""
     var globalPass :  String = ""
     var imagePass :   String = ""
     var filterData = [String]()
     struct HolderData {
        var name :    String
        var website : String
        var phone :   String
        var textdescription : String
    }
    var holder = [HolderData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        enterI.getdatalink()
        fecthData ()
        self.tableview.contentInset = UIEdgeInsetsMake(-20, 0, -20, 0);
//        navigationController?.navigationBar.barTintColor = UIColor.init(red: 0.212, green: 0.271, blue: 0.612, alpha: 1.00)
//        tabBarController?.tabBar.barTintColor = UIColor.init(red: 0.212, green: 0.271, blue: 0.612, alpha: 1.00)
        self.serachBar.endEditing(true)
        filterData = holder2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func fecthData (){
        for item in enterI.generalArray{
            holder.append(HolderData(name: item.name, website: item.website , phone: item.phoneNumber, textdescription: item.description))
        }
        for item in holder{
        holder2.append(item.name)
        
        }
    }
    
    
    // MARK: - Tableview Data Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print(nameSender)
       return filterData.count
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! CustomTableViewCell
    
        let holder_city =   filterData[indexPath.row]
        cell.schoolNameLAbel.text =  String(describing: holder_city)
        cell.imageview.image = UIImage(named:image[indexPath.row])

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     nameSender = filterData[indexPath.row]
     
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenDetailView" {
            if let indexPath = self.tableview.indexPathForSelectedRow {
                let controller = segue.destination as! DetialViewVC
                globalPass =  filterData[indexPath.row]
                imagePass = image[indexPath.row]
                controller.selectedName = globalPass
                    for item in holder {
                        if globalPass == item.name {
                            phoneSender = item.phone
                            websitePass = item.website
                            descriSender = item.textdescription
                        }
                    }
                controller.holderDetailWebiste = websitePass
                controller.holderDetialPhone = phoneSender
                controller.desc = descriSender
                controller.imageReceiver  = imagePass
                print(holder2[indexPath.row])
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    filterData = searchText.isEmpty ? holder2 : holder2.filter({(dataString: String) -> Bool in
    return dataString.range(of: searchText, options: .caseInsensitive) != nil
    })
    tableview.reloadData()
    }
    
    
    
    
    
}
