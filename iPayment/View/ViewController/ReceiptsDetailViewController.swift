//
//  ReceiptsDetailViewController.swift
//  iPayment
//
//  Created by Yan Alejandro Bello on 20/06/24.
//

import UIKit

final class ReceiptDetailViewController: UIViewController {
    
    private var receiptDetailView: ReceiptDetailView!
    
    private var receipt: Receipt
    
    init(receipt: Receipt) {
        self.receipt = receipt
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        receiptDetailView = ReceiptDetailView(navigationController: navigationController)
        receiptDetailView.configure(with: receipt)
        view = receiptDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comprovante"
        view.backgroundColor = .white
    }
}
