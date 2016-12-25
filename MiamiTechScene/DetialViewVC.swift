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
  
  
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var websiteName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      print(holderDetail)
        
       
        self.titleName.text = holderDetail
        self.websiteName.text = holderDetailWebiste
        self.phoneNumber.text = holderDetialPhone
        self.textView.text = desc
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
