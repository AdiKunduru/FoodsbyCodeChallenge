//
//  File.swift
//  FoodsbyCodeChallenge
//
//  Created by Aditya Nelakonda on 3/22/18.
//  Copyright © 2018 Aditya Nelakonda. All rights reserved.
//

import UIKit

class deliveryCell: UITableViewCell
{

    @IBOutlet var img: UIImageView!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var cutoffTime: UILabel!
    
    @IBOutlet var cutoffTxt: UITextView!
    
    @IBOutlet var dropoffTime: UILabel!
    
    @IBOutlet var dropoffTxt: UITextView!
    
    @IBOutlet var order: UIButton!
    

    
    @IBAction func orderButton(_ sender: Any) {
        //Update Order is Placed and reload Table Data
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        dropoffTime.text = "Delivered By"
        cutoffTime.text = "Order By"
        
        
    }
    
    
}
