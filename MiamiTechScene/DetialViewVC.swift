//
//  DetialViewVC.swift
//  MiamiTechScene
//
//  Created by davyngoma on 12/21/16.
//  Copyright © 2016 davyngoma. All rights reserved.
//

import UIKit

class DetialViewVC: UIViewController {
    var  holderDetail = ""
    var holderDetailWebiste = ""
    var holderDetialPhone = ""
    var desc = ""
    var selectedName = ""
    var imageReceiver = ""
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var websiteName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(holderDetail)
        print(selectedName)
        setLabelData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tapForWebsite = UITapGestureRecognizer(target: self, action:#selector(DetialViewVC.openWebsite))
        websiteName.isUserInteractionEnabled = true
        tapForWebsite.numberOfTapsRequired = 1
        websiteName.addGestureRecognizer(tapForWebsite)
        openWebsite()
        let tapForNumber = UITapGestureRecognizer(target: self, action:#selector(DetialViewVC.callNumber))
        phoneNumber.isUserInteractionEnabled = true
        phoneNumber.addGestureRecognizer(tapForNumber)
        tapForNumber.numberOfTapsRequired = 1
        callNumber ()
        openWebsite()
        
    }
    
    
   func setLabelData () {
    self.titleName.text = selectedName
    self.websiteName.text = holderDetailWebiste
    self.phoneNumber.text = holderDetialPhone
    self.textView.text = desc
   }
    func callNumber(){
        let number = NSURL(string: holderDetialPhone)
        UIApplication.shared.open(number as! URL, options: [:], completionHandler: nil)
        print("\(holderDetialPhone)")
    }
    func openWebsite(){
        let options = [UIApplicationOpenURLOptionUniversalLinksOnly : true]
        let website = NSURL(string: holderDetailWebiste)
        UIApplication.shared.open(website as! URL, options: options, completionHandler: nil)
         print("\(holderDetailWebiste)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
