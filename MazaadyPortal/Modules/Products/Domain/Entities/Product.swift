//
//  Product.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let currency: String
    let offer: Int?
    let endDate: Double?

    enum CodingKeys: String, CodingKey {
        case id, name, image, price, currency, offer
        case endDate = "end_date"
    }
}
