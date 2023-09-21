//
//  Environment.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import Foundation

struct Environment {

    // Use Case
    let countrieListUserCase: CountrieListUserCaseProtocol
    
    // Service Controller
    let countrieListServiceController: CountrieListServiceControllerProtocol
    
    // Helper, Singleton and Factory
    let networkContextFactory: NetworkContextFactoryProtocol
    
    init(
        countrieListUserCase: CountrieListUserCaseProtocol = CountrieListUserCase(),
        countrieListServiceController: CountrieListServiceControllerProtocol = CountrieListServiceController(),
        networkContextFactory: NetworkContextFactoryProtocol = NetworkContextFactory()
    ) {
        self.countrieListUserCase = countrieListUserCase
        self.countrieListServiceController = countrieListServiceController
        self.networkContextFactory = networkContextFactory
    }
}
