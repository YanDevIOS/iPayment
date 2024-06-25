//
//  ReceiptDetailView.swift
//  iPayment
//
//  Created by Yan Alejandro Bello on 21/06/24.
//

import UIKit

final class ReceiptDetailView: UIView {
    
    private var navigationController: UINavigationController?
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 190/255, alpha: 1.0)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var confirmationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = UIColor(red: 63/255, green: 160/255, blue: 69/255, alpha: 1.0)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame.size.width = 24
        imageView.frame.size.height = 24
        return imageView
    }()
    
    private let confirmationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.text = "Comprovante de Pagamento"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueInfoLabel: InformationLabel = {
        let infoLabel = InformationLabel(title: "Valor pago:", description: "")
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        return infoLabel
    }()
    
    private let paymentIdInfoLabel: InformationLabel = {
        let infoLabel = InformationLabel(title: "ID do pagamento:", description: "")
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        return infoLabel
    }()
    
    private let receiverInfoLabel: InformationLabel = {
        let infoLabel = InformationLabel(title: "Para:", description: "")
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        return infoLabel
    }()
    
    private let dateInfoLabel: InformationLabel = {
        let infoLabel = InformationLabel(title: "Data:", description: "")
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        return infoLabel
    }()
    
    private let controlInfoLabel: InformationLabel = {
        let infoLabel = InformationLabel(title: "Controle:", description: "")
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        return infoLabel
    }()
    
    init(navigationController: UINavigationController?) {
        super.init(frame: .zero)
        self.navigationController = navigationController
        setupViews()
        setupConstraints()
        backgroundColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(cardView)
        addSubview(confirmationIcon)
        addSubview(confirmationLabel)
        addSubview(valueInfoLabel)
        addSubview(paymentIdInfoLabel)
        addSubview(receiverInfoLabel)
        addSubview(dateInfoLabel)
        addSubview(controlInfoLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            confirmationIcon.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            confirmationIcon.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            
            confirmationLabel.centerYAnchor.constraint(equalTo: confirmationIcon.centerYAnchor),
            confirmationLabel.leadingAnchor.constraint(equalTo: confirmationIcon.trailingAnchor, constant: 10),
            
            valueInfoLabel.topAnchor.constraint(equalTo: confirmationLabel.bottomAnchor, constant: 16),
            valueInfoLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            valueInfoLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            paymentIdInfoLabel.topAnchor.constraint(equalTo: valueInfoLabel.bottomAnchor, constant: 16),
            paymentIdInfoLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            paymentIdInfoLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            receiverInfoLabel.topAnchor.constraint(equalTo: paymentIdInfoLabel.bottomAnchor, constant: 16),
            receiverInfoLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            receiverInfoLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            dateInfoLabel.topAnchor.constraint(equalTo: receiverInfoLabel.bottomAnchor, constant: 16),
            dateInfoLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            dateInfoLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            controlInfoLabel.topAnchor.constraint(equalTo: dateInfoLabel.bottomAnchor, constant: 16),
            controlInfoLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            controlInfoLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            controlInfoLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with receipt: Receipt) {
        valueInfoLabel.setDescription(receipt.amount)
        paymentIdInfoLabel.setDescription(receipt.receiptId)
        receiverInfoLabel.setDescription(receipt.receiverName)
        dateInfoLabel.setDescription(receipt.date)
        controlInfoLabel.setDescription(receipt.control)
    }
}
