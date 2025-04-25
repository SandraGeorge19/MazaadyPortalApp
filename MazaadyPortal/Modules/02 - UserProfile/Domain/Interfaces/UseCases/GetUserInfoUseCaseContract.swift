//
//  GetUserInfoUseCaseContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol GetUserInfoUseCaseContract {
    func execute() async throws -> UserInfo
}
