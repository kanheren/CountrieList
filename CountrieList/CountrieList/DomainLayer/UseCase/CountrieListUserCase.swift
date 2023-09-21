//
//  CountrieListUserCase.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import Foundation

protocol CountrieListUserCaseProtocol {
    func fatchCountrieListRequest(request: CountrieList.Request,
                               completion: @escaping (ServiceOutcome<CountrieList.Response>) -> Void)
}

class CountrieListUserCase: CountrieListUserCaseProtocol {
    
    func fatchCountrieListRequest(request: CountrieList.Request,
                               completion: @escaping (ServiceOutcome<CountrieList.Response>) -> Void) {
        
        AppEnvironment.current.countrieListServiceController.fatchCountrieListsResuest(request: request,
                                                                                 completion: { response in
            switch response {
            case let .Success(success):
                print("Success: \(success)")
                completion(.Success(success))
            case .Error(_):
                print("error")
            }
        })
    }
}
