import Foundation

protocol SearchForProductUseCaseContract {
    func execute(searchText: String) async throws -> [Product]
}
