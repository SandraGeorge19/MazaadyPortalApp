import Foundation

protocol ProductsRepositoryContract {
    func getAllProducts() async throws -> [Product]
    func searchForProducts(with name: String) async throws -> [Product]
}
