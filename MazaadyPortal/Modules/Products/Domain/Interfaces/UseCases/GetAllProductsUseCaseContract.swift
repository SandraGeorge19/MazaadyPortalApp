import Foundation

protocol GetAllProductsUseCaseContract {
    func execute() async throws -> [Product]
}
