//
//  CountrieListModel.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import Foundation

struct CountrieListModel {
    var name: String
    var region: String
    var code: String
    var capital: String
    var flag: String
    
    init(name: String, region: String, code: String, capital: String, flag: String) {
        self.name = name
        self.region = region
        self.code = code
        self.capital = capital
        self.flag = flag
    }
}
