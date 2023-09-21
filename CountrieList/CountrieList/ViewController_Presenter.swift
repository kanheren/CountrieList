//
//  ViewController_Presenter.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import Foundation

protocol ViewController_PresenterProtocol: AnyObject {
    func fatchCountrieListsData()
}

class ViewController_Presenter: ViewController_PresenterProtocol {
    
    var countrieListArray = [CountrieList.Response]()
    weak var viewController: ViewController_ViewControllerProtocol?
    
    required init(_ viewController: ViewController_ViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func fatchCountrieListsData() {
        let countrieListRequest = CountrieList.Request()
        AppEnvironment.current.countrieListUserCase.fatchCountrieListRequest(request: countrieListRequest,
                                                                       completion: { result in
            switch result {

            case let .Success(successObject):
                print("countrieLists success object")
                self.viewController?.countrieListResponse(countrieListResponse: successObject)
            case .Error(_):
                print("error")
            }
        })
    }
    
}
