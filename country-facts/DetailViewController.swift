//
//  DetailViewController.swift
//  country-facts
//
//  Created by Bradley Chesworth on 31/03/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedCountryTitle: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCountryTitle
        navigationItem.largeTitleDisplayMode = .never
    }
}
