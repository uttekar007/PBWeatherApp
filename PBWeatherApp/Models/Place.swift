//
//  Place.swift
//  YahooWeather
//
//  Created by Nilesh Uttekar on 17/05/18.
//  Copyright © 2018 Nilesh Uttekar. All rights reserved.
//

import UIKit

class Place
{
    private var data: [String: Any]?
     var country: [String: Any]?
     var admin1: [String: Any]?
     var admin2: [String: Any]?
     var admin3: [String: Any]?
     var woeid:String?
    var name:String?
     var placeTypeName:[String: Any]?
     var locality1:[String: Any]?
     var locality2:[String: Any]?
     var timezone:[String: Any]?
    
    init(place: Dictionary<String, Any>) {
        data = place
        parseAdmin1()
        parseAdmin2()
        parseAdmin3()
        parseWoeid()
        parseLocality1()
        parseLocality2()
        parseTimezone()
        parseCountry()
        parseName()

    }
    
    private func parseAdmin1(){
        if(data != nil)
        {
            guard let item = self.data!["admin1"] as? [String: Any] else {
                return;
            }
            self.admin1 = item
        }
    }
    
    private func parseName()
    {
        if(data != nil)
        {
            guard let item = self.data!["name"] as? String? else {
                return;
            }
            self.name = item
        }
    }
    
    private func parseAdmin2(){
        if(data != nil)
        {
            guard let item = self.data!["admin2"] as? [String: Any] else {
                return;
            }
            self.admin2 = item
        }
    }
    
    private func parseAdmin3(){
        if(data != nil)
        {
            guard let item = self.data!["admin3"] as? [String: Any] else {
                return;
            }
            self.admin3 = item
        }
    }
    
    private func parseLocality1(){
        if(data != nil)
        {
            guard let item = self.data!["locality1"] as? [String: Any] else {
                return;
            }
            self.locality1 = item
        }
    }
    
    private func parseLocality2(){
        if(data != nil)
        {
            guard let item = self.data!["locality2"] as? [String: Any] else {
                return;
            }
            self.locality2 = item
        }
    }
    
    private func parseTimezone(){
        if(data != nil)
        {
            guard let item = self.data!["timezone"] as? [String: Any] else {
                return;
            }
            self.timezone = item
        }
    }
    
    private func parseWoeid(){
        if(data != nil)
        {
            guard let item = self.data!["woeid"] as? String? else {
                return;
            }
            self.woeid = item
        }
    }
    
    private func parseCountry(){
        if(data != nil)
        {
            guard let item = self.data!["country"] as? [String: Any] else {
                return;
            }
            self.country = item
        }
    }
    
}
