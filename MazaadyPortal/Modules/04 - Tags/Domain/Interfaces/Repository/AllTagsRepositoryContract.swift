//
//  AllTagsRepositoryContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol AllTagsRepositoryContract {
    func getAllTags() async throws -> AllTags
}
