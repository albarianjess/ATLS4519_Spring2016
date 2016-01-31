//
//  SearchResultsController.swift
//  Lab2
//
//  Created by Jessie Albarian on 1/27/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController, UISearchResultsUpdating {

    /*
    Variables
    */
    var allwords = [String : [String]]()
    var letters = [String]()
    var filteredWords = [String]()
    
    
    
    //UISearchResultsUpdating protocol required method to implement the search
    func updateSearchResultsForSearchController(searchController:
        UISearchController) {
            let searchString = searchController.searchBar.text
            filteredWords.removeAll(keepCapacity: true)
            if searchString?.isEmpty == false {
                let filter: String -> Bool = { name in
                    let range = name.rangeOfString(searchString!, options:NSStringCompareOptions.CaseInsensitiveSearch)
                    return range != nil
                }
                for key in letters {
                    let wordsForKeys = allwords[key]!
                    let matches = wordsForKeys.filter(filter)
                    filteredWords.appendContentsOf(matches)
                }
            }
            tableView.reloadData()
    }
    
    
    


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
            return filteredWords.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            let cell =
            tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath:
                indexPath)
            cell.textLabel?.text = filteredWords[indexPath.row]
            return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //register our table cell identifier
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:
            "CellIdentifier")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
