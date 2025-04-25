//
//  UserInfoRepositoryContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol UserInfoRepositoryContract {
    func getUserInfo() async throws -> UserInfo
}
