//
//  ReceiptsViewModelTests.swift
//  iPaymentTests
//
//  Created by Yan Alejandro Bello on 20/06/24.
//

import XCTest
@testable import iPayment

class ReceiptsViewModelTests: XCTestCase {

    var viewModel: ReceiptsViewModel!
    var service: ReceiptsService!

    override func setUp() {
        super.setUp()
        service = ReceiptsService()
        viewModel = ReceiptsViewModel(service: service)
    }

    override func tearDown() {
        viewModel = nil
        service = nil
        super.tearDown()
    }

    func testFetchReceipts() {
        let expectation = self.expectation(description: "Reload Data Called")
        viewModel.reloadData = {
            expectation.fulfill()
        }
        
        viewModel.fetchReceipts()
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(viewModel.numberOfItems(), 10)
    }
}
