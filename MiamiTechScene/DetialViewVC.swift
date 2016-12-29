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
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var phoneNumber: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(holderDetail)
        print(selectedName)
        setLabelData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       navigationController?.navigationBar.barTintColor = UIColor.init(red: 0.212, green: 0.271, blue: 0.612, alpha: 1.00)
       tabBarController?.tabBar.barTintColor = UIColor.init(red: 0.212, green: 0.271, blue: 0.612, alpha: 1.00)
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = borderColor.cgColor
        textView.layer.cornerRadius = 5.0
    }
    func setLabelData () {
    self.titleName.text = selectedName
    self.websiteName.text = holderDetailWebiste
    self.phoneNumber.setTitle(holderDetialPhone,for: .normal)
    self.textView.text = desc
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // MARK: - Action Buttom

    @IBAction func phoneNumberCall(_ sender: Any) {
        let number = NSURL(string: holderDetialPhone)
        UIApplication.shared.open(number as! URL, options: [:], completionHandler: nil)
        print("\(holderDetialPhone)")
    }
}
