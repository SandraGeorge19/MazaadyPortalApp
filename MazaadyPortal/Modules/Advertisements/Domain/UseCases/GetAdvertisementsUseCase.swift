
class GetAdvertisementsUseCase: GetAdvertisementsUseCaseContract {
    private let repository: AdvertisementsRepositoryContract
    
    init(repository: AdvertisementsRepositoryContract = AdvertisementsRepository()) {
        self.repository = repository
    }
    
    func execute() async throws -> Advertisements {
        try await repository.getAllAdds()
    }
}