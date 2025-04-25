//
//  UserInfo.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

// MARK: - UserInfo
struct UserInfo: Codable {
    let id: Int
    let name: String
    let image: String
    let userName: String
    let followingCount, followersCount: Int
    let countryName, cityName: String

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case userName = "user_name"
        case followingCount = "following_count"
        case followersCount = "followers_count"
        case countryName = "country_name"
        case cityName = "city_name"
    }
}
