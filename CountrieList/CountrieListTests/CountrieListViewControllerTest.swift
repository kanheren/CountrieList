//
//  CountrieListViewControllerTest.swift
//  CountrieListTests
//
//  Created by Nandkishore Kanhere on 9/21/23.
//

import XCTest
@testable import CountrieList

class CountrieListViewControllerTest: XCTestCase {

    func testCountrieListCountZero() {
        let CountrieListViewController = CountrieListViewController()
        XCTAssertEqual(CountrieListViewController.countrieLists.count, 0, "Must be 0")
    }
    func testCountrieListsCounts() {
        var tempCountrieListArray = [CountrieListModel]()
        let tempCountrie1 = CountrieListModel(name: "Iceland", region: "EU", code: "IS", capital: "Reykjavik", flag: "test1")
        let tempCountrie2 = CountrieListModel(name: "Hungary", region: "EU", code: "HU", capital: "Budapest", flag: "test2")
        let tempCountrie3 = CountrieListModel(name: "India", region: "AS", code: "IN", capital: "New Delhi", flag: "test3")
        let tempCountrie4 = CountrieListModel(name: "Indonesia", region: "AS", code: "ID", capital: "Jakarta", flag: "test4")
        let tempCountrie5 = CountrieListModel(name: "Libya", region: "AF", code: "LR", capital: "Tripoli", flag: "test5")
        tempCountrieListArray.append(tempCountrie1)
        tempCountrieListArray.append(tempCountrie2)
        tempCountrieListArray.append(tempCountrie3)
        tempCountrieListArray.append(tempCountrie4)
        tempCountrieListArray.append(tempCountrie5)
        let CountrieListViewController = CountrieListViewController()
        CountrieListViewController.countrieLists = tempCountrieListArray
        XCTAssertEqual(CountrieListViewController.countrieLists.count, 5, "Must be 0")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
