//
//  ReceiptsCoordinator.swift
//  iPayment
//
//  Created by Yan Alejandro Bello on 19/06/24.
//

import UIKit

final class ReceiptsCoordinator: Coordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let receiptsViewModel = ReceiptsViewModel()
        let receiptsViewController = ReceiptsListViewController(viewModel: receiptsViewModel, coordinator: self)
        navigationController.pushViewController(receiptsViewController, animated: false)
    }

    func showReceiptDetail(receipt: Receipt) {
        let receiptDetailViewController = ReceiptDetailViewController(receipt: receipt)
        navigationController.pushViewController(receiptDetailViewController, animated: true)
    }
}
