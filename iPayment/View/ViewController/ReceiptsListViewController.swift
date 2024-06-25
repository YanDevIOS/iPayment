//
//  ReceiptsListViewController.swift
//  iPayment
//
//  Created by Yan Alejandro Bello on 19/06/24.
//

import UIKit

final class ReceiptsListViewController: UIViewController {
    
    private let viewModel: ReceiptsViewModel
    private let coordinator: ReceiptsCoordinator
    private var receiptsListView: ReceiptsListView!
    
    init(viewModel: ReceiptsViewModel, coordinator: ReceiptsCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        receiptsListView = ReceiptsListView()
        receiptsListView.collectionView.delegate = self
        receiptsListView.collectionView.dataSource = self
        view = receiptsListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comprovantes"
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.fetchReceipts()
        viewModel.reloadData = { [weak self] in
            self?.receiptsListView.collectionView.reloadData()
        }
    }
}

extension ReceiptsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReceiptsCollectionViewCell.identifier, for: indexPath) as? ReceiptsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let receipt = viewModel.receipt(at: indexPath)
        cell.configure(with: receipt)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let receipt = viewModel.receipt(at: indexPath)
        coordinator.showReceiptDetail(receipt: receipt)
    }
}
