//
//  HttpRequestBuilderDelegate.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import Foundation

protocol HttpRequestBuilderDelegate: AnyObject {

    var httpRequest: HttpRequest { get set }
    
    func buildURI()
    func buildBody()
    func buildHeaders()
}
