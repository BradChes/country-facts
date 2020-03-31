//
//  DetailViewController.swift
//  country-facts
//
//  Created by Bradley Chesworth on 31/03/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var selectedCountry: Country?
    var informationArray = [(String, String)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCountry?.name
        navigationItem.largeTitleDisplayMode = .never
        
        if let country = selectedCountry {
            informationArray = [("Capital", country.capital),
                                ("Spoken Language", country.language),
                                ("Currency", country.currency),
                                ("Interesting Fact", country.fact)]
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Information", for: indexPath)
        let title = informationArray[indexPath.row].0
        let content = informationArray[indexPath.row].1
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = content
            
        return cell
    }
}
