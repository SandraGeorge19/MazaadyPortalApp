//
//  UserInfoServiceContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol UserInfoServiceContract {
    func getUserInfo() async throws -> UserInfo
}
