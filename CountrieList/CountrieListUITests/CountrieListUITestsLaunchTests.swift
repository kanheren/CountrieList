//
//  CountrieListUITestsLaunchTests.swift
//  CountrieListUITests
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import XCTest

class CountrieListUITestsLaunchTests: XCTestCase {

    let app = XCUIApplication()
    let device = XCUIDevice.shared
    
    // Test tap on Display
    func testDisplayButtonTap() throws {
        app.launch()
        app.buttons["Display"].tap()
        device.orientation = UIDeviceOrientation.portrait
    }
  
    // Test tap on Home navigation bar button
    func testHomeButtonTap() throws {
        app.launch()
        app.buttons["Display"].tap()
        app.navigationBars.element.buttons["HOME"].tap()
        device.orientation = UIDeviceOrientation.portrait
    }
    
    // Test table view and cell
    func testTableViewAndCell() throws {
        app.launch()
        app.buttons["Display"].tap()
        
        let table = app.tables["CountrieListTableView"]
        let cell = table.cells["CountrieListTableViewCell0"]
        XCTAssertEqual(cell.identifier, "CountrieListTableViewCell0", "Must be 0")
        cell.tap()
        device.orientation = UIDeviceOrientation.portrait
    }

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
