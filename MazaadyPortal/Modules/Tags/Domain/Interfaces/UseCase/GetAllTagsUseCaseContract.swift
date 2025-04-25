//
//  GetAllTagsUseCaseContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol GetAllTagsUseCaseContract {
    func execute() async throws -> AllTags
}
