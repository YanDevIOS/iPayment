//
//  ReceiptsFactory.swift
//  iPayment
//
//  Created by Yan Alejandro Bello on 20/06/24.
//

import UIKit

final class ReceiptsFactory {
    static func makeReceiptsListViewController(coordinator: ReceiptsCoordinator) -> ReceiptsListViewController {
        let viewModel = ReceiptsViewModel()
        let viewController = ReceiptsListViewController(viewModel: viewModel, coordinator: coordinator)
        return viewController
    }
}
