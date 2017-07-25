//
//  RequestViewController.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit
import MBProgressHUD

class RequestsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var searchBar: UISearchBar!
    var searchSettings = SearchSettings()
    var requests: [Request]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hardCodeAddRequests()
        
        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        // Perform the first search when the view controller first loads
        doSearch()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! RequestCell
        cell.request = requests[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if requests == nil {
            return 0
        }
        return requests.count
    }
    
    // Perform the search.
    fileprivate func doSearch() {
        
        // MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* TODO: Check this stuff out
         
        // Perform request to GitHub API to get the list of repositories
        GithubRepo.fetchRepos(searchSettings, successCallback: { (newRepos) -> Void in
            
            self.repos = newRepos
            
            // Print the returned repositories to the output window
            for repo in newRepos {
                print(repo)
            }
            
            self.tableView.reloadData()
            
            MBProgressHUD.hide(for: self.view, animated: true)
        }, error: { (error) -> Void in
            print(error!)
        })
         */
    }
    
    func hardCodeAddRequests() {
        requests = []
        requests.append(Request(dictionary: [
            "title" : "Hawaiian Shirt, size M",
            "user" : User(dictionary: ["name" : "Frat-boy-party"]),
            "price" : 600,
            "date_needed" : Date(),
            "info" : "I'm going to a frat party, just gimme something that looks Hawaiian!"
        ]))
        
        requests.append(Request(dictionary: [
            "title" : "Blond wig",
            "user" : User(dictionary: ["name" : "FUTUREstar"]),
            "price" : 300,
            "date_needed" : Date(),
            "info" : "I need to play Hannah Montana for a video project!"
        ]))
        
        requests.append(Request(dictionary: [
            "title" : "Suede protector",
            "user" : User(dictionary: ["name" : "Love-myShoeS"]),
            "price" : 200,
            "date_needed" : Date(),
            "info" : "GOTTA PROTECT MY FAVORITE SUEDE SHOES! I'll use just a little bit I promise"
        ]))
    }
}

// SearchBar methods
extension RequestsViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}
