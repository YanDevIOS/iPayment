//
//  ReceiptsServiceTests.swift
//  iPaymentTests
//
//  Created by Yan Alejandro Bello on 21/06/24.
//

import XCTest
@testable import iPayment

class ReceiptsServiceTests: XCTestCase {
    
    var service: ReceiptsService!

    override func setUp() {
        super.setUp()
        service = ReceiptsService()
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testFetchReceiptsSuccess() {
        let expectation = self.expectation(description: "Fetching Receipts")
        
        service.fetchReceipts { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data.receipts)
                XCTAssertEqual(data.receipts.count, 10)
            case .failure:
                XCTFail("Expected success but got failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchReceiptsFailure() {
        class MockErrorService: ReceiptsService {
            override func fetchReceipts(completion: @escaping (Result<ReceiptsData, Error>) -> Void) {
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        completion(.failure(NSError(domain: "Test error", code: 500, userInfo: nil)))
                    }
                }
            }
        }
        
        let service = MockErrorService()
        let expectation = self.expectation(description: "Fetching Receipts")
        
        service.fetchReceipts { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
