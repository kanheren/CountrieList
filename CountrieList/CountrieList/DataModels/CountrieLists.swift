//
//  CountrieLists.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import Foundation

public struct CountrieList {

    //Response
    public struct Response: Codable {
        var name: String
        var region: String
        var code: String
        var capital: String
        var flag: String
    }

    //Request
    public struct Request: Codable {
    }
}
