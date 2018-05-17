//
//  CityData.swift
//  YahooWeather
//
//  Created by Nilesh Uttekar on 17/05/18.
//  Copyright © 2018 Nilesh Uttekar. All rights reserved.
//

import UIKit
import Foundation

class CityData {
    
    private var data: [String: Any]?
    var placeArray: [Place] = []
    
//    private var forecast: [[String: Any]]?
//    private var condition: [String: Any]?
//    private var items: [String: Any]?
//    private var astronomy: [String: Any]?
//    private var wind: [String: Any]?
//    private var channel: [String: Any]?
    
    init(cityDict: Dictionary<String, Any>) {
        data = cityDict
        parsePlaces()
    }
    
    private func parsePlaces(){
        if data != nil {
            guard let query = data!["query"] as? [String: Any],
                let result = query["results"] as? [String: Any], let places = result["place"] as? [[String: Any]] else {
                    return;
            }
            for place in places
            {
                let currePlace = Place(place: place)
                //if currePlace.locality1 != nil
                //{
                    placeArray.append(currePlace)
                //}
                
            }
        }
    }
    

}
