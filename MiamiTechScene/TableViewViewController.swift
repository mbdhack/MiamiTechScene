//
//  TableViewViewController.swift
//  MiamiTechScene
//
//  Created by davyngoma on 12/2/16.
//  Copyright © 2016 davyngoma. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var tableview: UITableView!
     var enterI = BaseClass(latitude: 0.0, longitude: 0.0)
    
     var holder2 = [String]()
     var holder3 = [String]()
     var nameSender :String = ""
     var phoneSender : String = ""
     var website : String = ""
     var descriSender: String = ""
    
    struct HolderData {
        var name : String
        var website : String
        var phone : String
        var textdescription : String
    }
    
     var holder = [HolderData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        enterI.getdatalink()
        fecthData ()
        self.tableview.contentInset = UIEdgeInsetsMake(-20, 0, -20, 0);
       //poisition (pos: nameSender)
        passDataVC(name: nameSender)
        
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
       return  holder2.count
    }
    
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! CustomTableViewCell
    
        let holder_city =   holder2[indexPath.row]
        cell.schoolNameLAbel.text =  String(describing: holder_city)
        cell.imageview.image = UIImage(named:image[indexPath.row])

        return cell
    }
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     nameSender = holder2[indexPath.row]
        
       
        
    }
    
   
    func passDataVC (name : String){
    for item in holder2{
        for item2 in holder {
                    nameSender = item2.name
                phoneSender = item2.phone
                website = item2.website
                descriSender = item2.textdescription
                }
            }
        
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier ==  "OpenDetailView" {
            let DetialVc = segue.destination as! DetialViewVC
            
             DetialVc.holderDetail   = nameSender
             DetialVc.holderDetailWebiste = website
             DetialVc.holderDetialPhone = phoneSender
             DetialVc.desc = description
            
            
        
        }
    
    }
    
  }
