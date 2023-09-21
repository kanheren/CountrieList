//
//  NetworkContextFactory.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import Foundation

import Foundation

protocol NetworkContextFactoryProtocol {
    func getNetworkContext(withStrategy networkStrategy: NetworkStrategy) -> NetworkContextProtocol
}

class NetworkContextFactory: NetworkContextFactoryProtocol {
    func getNetworkContext(withStrategy networkStrategy: NetworkStrategy) -> NetworkContextProtocol {
        FXSNetworkContext(withStrategy: networkStrategy)
    }
}
