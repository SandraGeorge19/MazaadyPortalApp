//
//  AllTags.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//


// MARK: - AllTags
struct AllTags: Codable {
    let tags: [Tag]
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name: String
}
