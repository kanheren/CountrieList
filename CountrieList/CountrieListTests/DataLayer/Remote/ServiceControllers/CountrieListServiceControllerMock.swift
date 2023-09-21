//
//  CountrieListServiceControllerMock.swift
//  CountrieListTests
//
//  Created by Nandkishore Kanhere on 9/21/23.
//

import Foundation
@testable import CountrieList

class CountrieListServiceControllerMock: CountrieListServiceControllerProtocol {
    private var countrieListResponse: [CountrieList.Response]?
    private var error: Error?

    init(
        countrieListResponse: [CountrieList.Response]? = nil,
        error: Error? = nil
    ) {
        self.countrieListResponse = countrieListResponse
        self.error = error
    }

    func fatchCountrieListsResuest(request: CountrieList.Request, completion: @escaping (ServiceOutcome<CountrieList.Response>) -> Void) {
        if let countrieListResponse = self.countrieListResponse {
            completion(.Success(countrieListResponse))
            return
        }
    }
}
