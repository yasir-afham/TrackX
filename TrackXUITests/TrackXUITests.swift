//
//  TrackXUITests.swift
//  TrackXUITests
//
//  Created by Yasir Afham.
//

import XCTest

final class TrackXUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

       
    }

    override func tearDownWithError() throws {
  
    }

    @MainActor
    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()

        
    }

    @MainActor
    func testLaunchPerformance() throws {
        
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
