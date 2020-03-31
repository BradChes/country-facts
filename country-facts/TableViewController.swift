//
//  ViewController.swift
//  country-facts
//
//  Created by Bradley Chesworth on 31/03/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var countries = ["England","Wales","Scotland","Republic of Ireland","Northern Ireland", "France", "Germany", "America"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country Facts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedCountryTitle = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

