protocol ProductsServiceContract {
    func getAllProducts() async throws -> [Product]
    func searchForProducts(with name: String) async throws -> [Product]
}
