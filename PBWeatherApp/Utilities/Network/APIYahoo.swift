//
//  APIYahoo.swift
//  YahooWeather
//
//  Created by Nilesh Uttekar on 17/05/2018.
//  Copyright © 2018 Nilesh Uttekar. All rights reserved.
//

import Foundation


let QUERY_PREFIX = "https://query.yahooapis.com/v1/public/yql?q="
let QUERY_SUFFIX = "&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"

/*
 https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.places%20where%20text%3D%22pu*%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys
 */
//
func queryToYahoo(statement: String) -> Dictionary<String, AnyObject> {
    let query = "\(QUERY_PREFIX)\(statement.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)\(QUERY_SUFFIX)"
    print(query)
    var dictionary: Dictionary<String, AnyObject>?
    do {
        let data: Data = try Data(contentsOf: URL(string:query)!) as Data
        dictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)  as? Dictionary<String, AnyObject>
    } catch {
        print("Error loading data...")
    }
    return dictionary!
}

