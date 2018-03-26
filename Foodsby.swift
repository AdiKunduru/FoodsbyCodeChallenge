//
//  Foodsby.swift
//  FoodsbyCodeChallenge
//
//  Created by Aditya Nelakonda on 3/25/18.
//  Copyright © 2018 Aditya Nelakonda. All rights reserved.
//

import UIKit

class Foodbsy{
    
    
    struct delivery
    {
        let day : Any
        let deliveryId : Any
        let storeId : Any
        let restaurantName : Any
        let logoUrl : Any
        let cutoff :  Any
        let dropoff : Any
        let soldOut : Bool
        let sellingOut : Bool
        let isPastCutoff : Bool
        let isOrderPlaced : Bool
    }
    
    //Delivery Information for every single day
    var totalDeliveries = [delivery]()
    
    //Delivery Information for a specific day
    var deliveryArray = [delivery]()
    
    //Populates Segment Control
    var deliveryDays = [String]()
    
    
    init()
    {
        totalDeliveries = []
        deliveryArray = []
        deliveryDays = []
    }
    
    
    //Read Json Information
    func loadData()
    {
        let path = Bundle.main.path(forResource: "deliveries-sample", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do
        {
            let data = try Data.init(contentsOf: url)
            // let myData = try JSONDecoder().decode(dropoffs.self, from: data)
            //  print(myData)
            let deliveryData = try JSONSerialization.jsonObject(with: data, options: []) as! [String:AnyObject]
            //  print(deliveryData)
            
            guard let json = deliveryData["dropoffs"] as? [[String:Any]] else {return}
            
            for value in json {
                guard let valueDict = value as? [String:Any] else {return}
                guard let day = valueDict["day"] as? String else {return}
                
                guard let deliveryDict = valueDict["deliveries"] as? [[String:Any]] else {return}
                
                if(!deliveryDict.isEmpty)
                {
                    deliveryDays.append(day)
                }
                
                for d in deliveryDict{
                    
                    let myDelivery = delivery(day: day, deliveryId: d["deliveryId"] as! Int, storeId: d["storeId"] as! Int, restaurantName: d["restaurantName"]  , logoUrl: d["logoUrl"] , cutoff: d["cutoff"] , dropoff: d["dropoff"] , soldOut: d["soldOut"] as! Bool, sellingOut: d["sellingOut"] as! Bool, isPastCutoff: d["isPastCutoff"] as! Bool, isOrderPlaced: d["isOrderPlaced"] as! Bool )
                    totalDeliveries.append(myDelivery)
                }
            }
        }
        catch{print(error)}
        
    }
    
    
    //Populate the Segmented Control using the deliveryDays array
   
    
  //  @IBAction func selectDate(_ sender: Any) {
 //       deliveryArray = []
  //      sortData()
  //  }
    
    //Filters all the delivery data based on the day that is selected in the segment control
    func sortData(compareDay : String)
    {
        
        for d in totalDeliveries
        {
            if(d.day as! String == compareDay)
            {
                deliveryArray.append(d)
            }
        }
    //    deliveryTable.reloadData()
    }
    
    
    
    
}
