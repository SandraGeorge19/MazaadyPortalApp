// MARK: - AllTags
struct AllTags: Codable {
    let tags: [Tag]
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name: String
}
