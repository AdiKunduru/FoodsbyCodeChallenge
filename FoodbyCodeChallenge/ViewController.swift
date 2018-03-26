//
//  ViewController.swift
//  FoodsbyCodeChallenge
//
//  Created by Aditya Nelakonda on 3/21/18.
//  Copyright © 2018 Aditya Nelakonda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet var menu: UISegmentedControl!
    @IBOutlet var deliveryTable: UITableView!
    
    var foodsby = Foodbsy()

    override func viewDidLoad() {
        super.viewDidLoad()
        foodsby.loadData()
        fillMenu()
        
        deliveryTable.delegate = self
        deliveryTable.dataSource = self
        
        deliveryTable.center = CGPoint.init(x: (view.frame.width / 2), y: ((view.frame.height / 2) + 25))
        menu.center = CGPoint.init(x: (view.frame.width / 2), y: (55))
        
    }
    
    //Populate the Segmented Control using the deliveryDays array
    func fillMenu()
    {
    
        menu.removeAllSegments()

        let day = foodsby.deliveryDays[0]
        for (i, day) in foodsby.deliveryDays.enumerated()
        {
           menu.insertSegment(withTitle: day, at: i, animated: false)
        }
        foodsby.sortData(compareDay: day)
        menu.selectedSegmentIndex = 0
    
    }
    
    @IBAction func selectDate(_ sender: Any) {
        foodsby.deliveryArray = []
        
        let selectedDateIndex = menu.selectedSegmentIndex
        let selectedDate = foodsby.deliveryDays[selectedDateIndex]
        
        foodsby.sortData(compareDay: selectedDate)
        
        deliveryTable.reloadData()
    }
    
    //Filters all the delivery data based on the day that is selected in the segment control
   
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsby.deliveryArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 150
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "cell"
        let cell = deliveryTable.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? deliveryCell
        
        
        // Configure the cell...
        
        let delivery = foodsby.deliveryArray[indexPath.row]
        cell?.name.text = delivery.restaurantName as? String
        cell?.dropoffTxt.text = delivery.dropoff as! String
        cell?.cutoffTxt.text = delivery.cutoff as! String
        
        cell?.name.adjustsFontSizeToFitWidth = true
        cell?.name.adjustsFontForContentSizeCategory = true
        cell?.dropoffTime.adjustsFontSizeToFitWidth = true
        cell?.dropoffTxt.adjustsFontForContentSizeCategory = true
        cell?.cutoffTime.adjustsFontSizeToFitWidth = true
        cell?.cutoffTxt.adjustsFontForContentSizeCategory = true
        cell?.order.adjustsImageSizeForAccessibilityContentSizeCategory = true
        cell?.order.isEnabled = true

        //Determining if the order can order and what message to display
        if(delivery.isOrderPlaced)
        {
            cell?.order.setTitle("Your order has been placed :)", for: .normal)
        }
        else if(delivery.isPastCutoff)
        {
            cell?.order.setTitle("Past Order Deadline :(", for: .normal)
            

        }
        else if(delivery.sellingOut)
        {
            cell?.order.setTitle("Order Soon!", for: .normal)
        }
        else if(delivery.soldOut)
        {
            cell?.order.setTitle("Sold Out :(", for: .normal)
        }
        else
        {
            cell?.order.setTitle("Place Order", for: .normal)
        }
        
        //Displaying restaurant logo
        let url = delivery.logoUrl as! String
        let imageURL = URL(string: url)
        let data = try? Data(contentsOf: imageURL!)
        cell?.img.image = UIImage(data: data!)
 
        return cell!
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

