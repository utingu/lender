//
//  ListingsViewController.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit
import MBProgressHUD

class ListingsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var searchBar: UISearchBar!
    var searchSettings = SearchSettings()
    var listings: [Listing]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hardCodeAddListings()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingCell", for: indexPath) as! ListingCell
        cell.listing = listings[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listings == nil {
            return 0
        }
        return listings.count
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
    
    func hardCodeAddListings() {
        listings = []
        listings.append(Listing(dictionary: [
            "title" : "5 inch black heels, size 8",
            "user" : User(dictionary: ["name" : "Emma Watson"]),
            "price" : 700,
            "image_url" : URL(string: "https://s-media-cache-ak0.pinimg.com/originals/b1/4f/59/b14f598e3491acccadca8490cab950b1.jpg")!,
            "date_available" : Date(),
            "info" : "Comfortable, beautiful, perfect for your night out! :)"
            ]))
        
        listings.append(Listing(dictionary: [
            "title" : "Nike Airmax, size 8",
            "user" : User(dictionary: ["name" : "sneakerGuy"]),
            "price" : 500,
            "image_url" : URL(string: "https://s-media-cache-ak0.pinimg.com/736x/9f/83/c1/9f83c1c2b49f92d2af0b239f411c8751.jpg")!,
            "date_available" : Date(),
            "info" : "Wassup"
            ]))
    }
}

// SearchBar methods
extension ListingsViewController: UISearchBarDelegate {
    
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
