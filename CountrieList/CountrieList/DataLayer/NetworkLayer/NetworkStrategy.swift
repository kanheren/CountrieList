//
//  NetworkStrategy.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import Foundation

class NetworkStrategy: NSObject {
    var httpRequest: HttpRequest!

    func connect(httpRequest _: HttpRequest,
                 contextCallback _: @escaping (NetworkOutcome) -> Void) {
        print("Your instantiation is parent class. Should be an appropriate child class instance")
    }
}
