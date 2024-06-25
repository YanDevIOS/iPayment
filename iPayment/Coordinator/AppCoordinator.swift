//
//  AppCoordinator.swift
//  iPayment
//
//  Created by Yan Alejandro Bello on 19/06/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let receiptsCoordinator: ReceiptsCoordinator

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.receiptsCoordinator = ReceiptsCoordinator(navigationController: navigationController)
    }

    func start() {
        receiptsCoordinator.start()
    }
}
