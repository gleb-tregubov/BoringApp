//
//  ServicesTests.swift
//  BoredAppTests
//
//  Created by Gleb Tregubov on 24.09.2021.
//

import XCTest
import BoredApp

class ServicesTests: XCTestCase {
    
    var services: ServicesProtocol!

    override func setUpWithError() throws {
        super.setUp()
        self.services = Services()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    
    func testServices() throws {
        let expecation = XCTestExpectation(description: "servicesExpectation")
        
        self.services.loadActivity(withParams: nil) { activity, error in
            
            if let _ = error {
                XCTAssertNotNil(error)
                XCTAssertNil(activity)
            } else {
                XCTAssertNotNil(activity)
                XCTAssertNil(error)
            }

            expecation.fulfill()
        }
        
        wait(for: [expecation], timeout: 1.0)
    }

}
