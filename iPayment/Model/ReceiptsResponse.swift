//
//  ReceiptsResponse.swift
//  iPayment
//
//  Created by Yan Alejandro Bello on 19/06/24.
//

import Foundation

struct ReceiptsResponse: Codable {
    let data: ReceiptsData
}

struct ReceiptsData: Codable {
    let receipts: [Receipt]
    let pagination: Pagination
}

struct Receipt: Codable {
    let title: String
    let receiptId: String
    let name: String
    let receiverName: String
    let amount: String
    let control: String
    let date: String
}

struct Pagination: Codable {
    let page: Int
    let pageSize: Int
    let totalElements: Int
    let totalPages: Int
}

