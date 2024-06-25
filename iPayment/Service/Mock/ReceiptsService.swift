//
//  ReceiptsService.swift
//  iPayment
//
//  Created by Yan Alejandro Bello on 20/06/24.
//
import Foundation

class ReceiptsService {
    
    func fetchReceipts(completion: @escaping (Result<ReceiptsData, Error>) -> Void) {
        DispatchQueue.global().async {
            do {
                if let url = Bundle.main.url(forResource: "Mock", withExtension: "json") {
                    let data = try Data(contentsOf: url)
                    let decodedData = try JSONDecoder().decode(ReceiptsResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decodedData.data))
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(NSError(domain: "File not found", code: 404, userInfo: nil)))
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
