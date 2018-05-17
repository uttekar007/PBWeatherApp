//
//  SearchViewController.swift
//  YahooWeather
//
//  Created by Nilesh Uttekar on 17/05/18.
//  Copyright © 2018 Nilesh Uttekar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var acitivityIndicator: UIActivityIndicatorView!
    @IBOutlet var citySearchBar: UISearchBar!
    @IBOutlet var tableView:UITableView!
    
    var currSearchText:String = ""
    var weatherDictionary: Dictionary<String, AnyObject>?
    var weatherData: WeatherData?
    var cityData:CityData?
    
    //var currentPlace : Place
    
    var placeArray:[Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSearchBar()
        // Do any additional setup after loading the view.
    }

    func initializeSearchBar()
    {
        currSearchText = ""
        citySearchBar.text = ""
        // TO DO : In future if we need globle search placehoder then define globle localization for search title
        citySearchBar.placeholder = NSLocalizedString("Search City", comment: "Search City")
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadCountryData(city: String) {
        
        acitivityIndicator.isHidden = false;
        weatherDictionary = queryToYahoo(statement: "select * from geo.places where text=\"\(city)*\" and placetype = 7")
      
        cityData = CityData(cityDict: weatherDictionary!)

        if(cityData != nil && cityData!.placeArray.count > 0)
        {
            placeArray = cityData!.placeArray
        }
        else
        {
            placeArray = []
        }
        tableView.reloadData()
        acitivityIndicator.isHidden = true;
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    
        if (segue.identifier == "showOtherCityForecast") {
            var svc = segue.destination as! SearchCityViewController;
            
            svc.currentPlace = placeArray[(tableView.indexPathForSelectedRow?.row)!]
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchViewController:UISearchBarDelegate
{
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool
    {
        return true
    }
    
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.showsCancelButton = false;
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        loadCountryData(city: searchText)
    }

}

extension SearchViewController:UITabBarDelegate
{
    
}

extension SearchViewController:UITableViewDataSource
{
    /// Method to rows count for tableview depending on the approval summary list count
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return placeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? UITableViewCell
        
        if !(cell != nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        let currentPlace  = placeArray[indexPath.row]
        var displayName = currentPlace.name
        if currentPlace.admin1 != nil
        {
            let country:String = currentPlace.admin1!["content"] as! String
            displayName = displayName! + ", " + country
        }
        
        if currentPlace.country != nil
        {
            let country:String = currentPlace.country!["content"] as! String
            displayName = displayName! + ", " + country
        }
        
        //let displayName = placeArray[indexPath.row].locality1!["content"]
        cell!.textLabel?.text = displayName as! String
        
        return cell!
    }
}

extension SearchViewController:UITableViewDelegate
{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier:"showOtherCityForecast", sender: self)
    }
}
