//
//  ReceiptsViewModel.swift
//  iPayment
//
//  Created by Yan Alejandro Bello on 20/06/24.
//

import Foundation

class ReceiptsViewModel {
    
    private var receipts: [Receipt] = []
    var reloadData: (() -> Void)?
    var service: ReceiptsService
    
    init(service: ReceiptsService = ReceiptsService()) {
        self.service = service
    }
    
    func fetchReceipts() {
        service.fetchReceipts { [weak self] result in
            switch result {
            case .success(let data):
                self?.receipts = data.receipts
                self?.reloadData?()
            case .failure(let error):
                print("Failed to fetch receipts:", error)
            }
        }
    }
    
    func numberOfItems() -> Int {
        return receipts.count
    }
    
    func receipt(at indexPath: IndexPath) -> Receipt {
        return receipts[indexPath.row]
    }
}
