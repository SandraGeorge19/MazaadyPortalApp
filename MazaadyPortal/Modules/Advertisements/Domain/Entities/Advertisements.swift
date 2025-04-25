// MARK: - Advertisements
struct Advertisements: Codable {
    let advertisements: [Advertisement]
}

// MARK: - Advertisement
struct Advertisement: Codable {
    let id: Int
    let image: String
}
