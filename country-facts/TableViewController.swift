//
//  ViewController.swift
//  country-facts
//
//  Created by Bradley Chesworth on 31/03/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country Facts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                parse(json: data)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedCountryTitle = countries[indexPath.row].name
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonCountries = try? decoder.decode(Countries.self, from: json) {
            countries = jsonCountries.countries
        }
    }

}

