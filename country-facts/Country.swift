//
//  Country.swift
//  country-facts
//
//  Created by Bradley Chesworth on 31/03/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import Foundation

struct Country: Codable {
    var name: String
    var capital: String
    var language: String
    var currency: String
    var fact: String
}
