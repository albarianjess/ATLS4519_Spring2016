//
//  ViewController.swift
//  Lab2
//
//  Created by Jessie Albarian on 1/27/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UITableViewController {

    /*
    Variables
    */
    var words : [String]!
    var titles : [String]!
    var allwords = [String: [String]]()
    var searchController : UISearchController!
//    let request = HTTPRequest(fileURLWithPath: "http://52.32.184.198/humanesociety/dogdata.json")

    
    let choice = CUBoulder()
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        
    }
    
    

    /*
    Customize the number of rows in the section
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let name = titles[section]
        let letterSection = allwords[name]! as [String]
        return letterSection.count
    }
    
    
    /*
    Displays table view cells
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            let section = indexPath.section
            let name = titles[section]
            let wordsSection = allwords[name]! as [String]
            let cell =
            tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath:
                indexPath) as UITableViewCell
            
            
            
            /*
            // Set subtitle and images
            */
            if (name == "Buildings"){
                cell.detailTextLabel?.text=""
                cell.imageView?.image = UIImage(named: "building.jpeg")
                
//                let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
//                self.navigationController!.pushViewController(secondViewController, animated: true)
                
            } else if (wordsSection[indexPath.row] == "Norlin Library"){
                cell.detailTextLabel?.text=""
                cell.imageView?.image = UIImage(named: "norlin.jpg")
            } else if (wordsSection[indexPath.row] == "Gemmill Library"){
                cell.detailTextLabel?.text=""
                cell.imageView?.image = UIImage(named: "norlin.jpg")
            } else if (wordsSection[indexPath.row] == "Pekoes"){
                cell.imageView?.image = UIImage(named: "pekoes.png")
                cell.detailTextLabel?.text=""
            } else if(wordsSection[indexPath.row] == "Celestial Seasonings"){
                cell.imageView?.image = UIImage(named: "cel.jpg")
                cell.detailTextLabel?.text=""
            } else if(wordsSection[indexPath.row] == "Laughing Goat"){
                cell.imageView?.image = UIImage(named: "goat.jpg")
                cell.detailTextLabel?.text=""
            } else if (name == "Dorms"){
                cell.imageView?.image = UIImage(named: "dorms.jpg")
                cell.detailTextLabel?.text=""
            }
            
            
            

            /*
            // Set titles
            */
            cell.textLabel?.text = wordsSection[indexPath.row]
            return cell
    }
    
//  ADD THIS FOR LATER

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return titles.count
    }
    
    
    /*
    Headers for sections
    */
    override func tableView(tableView: UITableView, titleForHeaderInSection
        section: Int) -> String? {
            return titles[section]
    }
    
    
    /*
    adds side bar with titles
    */
//    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
//        return titles
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        request.getURL()
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        let path = NSBundle.mainBundle().pathForResource("places", ofType: "plist")
        allwords = NSDictionary(contentsOfFile: path!) as! [String :[String]]
        titles = Array(allwords.keys)
        titles.sortInPlace({$0 < $1})
        
        
        
        //search results
        let resultsController = SearchResultsController()
        resultsController.allwords = allwords
        resultsController.letters = titles
        searchController = UISearchController(searchResultsController: resultsController)
        
        //search bar configuration
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = resultsController
        
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

