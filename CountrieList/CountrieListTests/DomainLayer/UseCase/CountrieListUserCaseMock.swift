//
//  CountrieListUserCaseMock.swift
//  CountrieListTests
//
//  Created by Nandkishore Kanhere on 9/21/23.
//

import Foundation
@testable import CountrieList

class CountrieListUseCaseMock: CountrieListUserCaseProtocol {
    var invokedCountrieList = false
    var invokedCountrieListCount = 0
    var invokedCountrieListParameters: (request: CountrieList.Request, Void)?
    var stubbedCountrieListCompletionHandlerResult: (ServiceOutcome<CountrieList.Response>)?
    
    func fatchCountrieListRequest(request: CountrieList.Request, completion: @escaping (ServiceOutcome<CountrieList.Response>) -> Void) {
        invokedCountrieList = true
        invokedCountrieListCount = 1
        invokedCountrieListParameters = (request, ())
        if let result = stubbedCountrieListCompletionHandlerResult {
            completion(result)
        }
    }
}
