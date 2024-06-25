//
//  ReceiptsCoordinatorTests.swift
//  iPaymentTests
//
//  Created by Yan Alejandro Bello on 20/06/24.
//

import XCTest
@testable import iPayment

class ReceiptsCoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var coordinator: ReceiptsCoordinator!

    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        coordinator = ReceiptsCoordinator(navigationController: navigationController)
    }

    override func tearDown() {
        navigationController = nil
        coordinator = nil
        super.tearDown()
    }

    func testStart() {
        coordinator.start()
        XCTAssertTrue(navigationController.viewControllers.first is ReceiptsListViewController)
    }

    func testShowReceiptDetail() {
        let receipt = Receipt(
            title: "Transferência",
            receiptId: "12345",
            name: "Débora dos Santos",
            receiverName: "João da Silva",
            amount: "R$ 100,00",
            control: "HDUS36217367127DS",
            date: "qua, 27 de abril de 2022"
        )
        coordinator.showReceiptDetail(receipt: receipt)
        XCTAssertTrue(navigationController.viewControllers.last is ReceiptDetailViewController)
    }
}

class AppCoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var coordinator: AppCoordinator!

    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        coordinator = AppCoordinator(navigationController: navigationController)
    }

    override func tearDown() {
        navigationController = nil
        coordinator = nil
        super.tearDown()
    }

    func testStart() {
        coordinator.start()
        XCTAssertTrue(navigationController.viewControllers.first is ReceiptsListViewController)
    }
}
