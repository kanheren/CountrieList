//
//  CountrieListServiceController.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import Foundation

protocol CountrieListServiceControllerProtocol {
    func fatchCountrieListsResuest(request: CountrieList.Request,
                                   completion: @escaping (_ response: ServiceOutcome<CountrieList.Response>) -> Void)
}

class CountrieListServiceController: CountrieListServiceControllerProtocol {
    
    func fatchCountrieListsResuest(request: CountrieList.Request,
                             completion: @escaping (ServiceOutcome<CountrieList.Response>) -> Void) {
        let requestBuilder = HttpRequestRestBuilder()
        requestBuilder.httpRequest.serviceName = "Countrie List"
        requestBuilder.httpRequest.serviceType = .external
        requestBuilder.httpRequest.uri = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
        requestBuilder.httpRequest.method = .get
        requestBuilder.httpRequest.dataBody = nil
        
        let requestDirector = HttpRequestDirector(httpRequestBuilder: requestBuilder)
        
        let httpRequest = requestDirector.constructHTTPRequest()
        
        let networkContext = AppEnvironment.current.networkContextFactory.getNetworkContext(withStrategy: HttpNetworkStrategy())
        networkContext.connect(httpRequest: httpRequest, serviceControllerCallback: { outcome in
            self.decode(CountrieList.Response.self, fromOutcome: outcome, completion: completion)
        })
    }
    
    private func decode<T>(_: T.Type,
                           fromOutcome outcome: NetworkOutcome,
                           completion: @escaping (_ response: ServiceOutcome<T>) -> Void) where T: Decodable {
        do {
            let response = try outcome.get()

            // a response without data is treated as malformed
            guard let data = response.data else { return }

            let decodedResponse = try JSONDecoder().decode([T].self, from: data)
            completion(.Success(decodedResponse))

            } catch {
                // network failure or request
                print("Network errro: CountrieList ServiceController failed to fetch")
        }
    }
}
