//
//  UserProfileViewModel.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation
import Combine

final class UserProfileViewModel: UserProfileViewModelContract {
    private let getUserInfoUseCase: GetUserInfoUseCaseContract
    private let getProductsUseCase: GetAllProductsUseCaseContract
    private let searchForProductsUseCase: SearchForProductUseCaseContract
    private let getAdvertisementUseCase: GetAdvertisementsUseCaseContract
    private let getAllTagsUseCase: GetAllTagsUseCaseContract
    
    init(
        getUserInfoUseCase: GetUserInfoUseCaseContract = GetUserInfoUseCase(),
        getProductsUseCase: GetAllProductsUseCaseContract = GetAllProductsUseCase(),
        searchForProductsUseCase: SearchForProductUseCaseContract = SearchForProductUseCase(),
        getAdvertisementUseCase: GetAdvertisementsUseCaseContract = GetAdvertisementsUseCase(),
        getAllTagsUseCase: GetAllTagsUseCaseContract = GetAllTagsUseCase()
    ) {
        self.getUserInfoUseCase = getUserInfoUseCase
        self.getProductsUseCase = getProductsUseCase
        self.searchForProductsUseCase = searchForProductsUseCase
        self.getAdvertisementUseCase = getAdvertisementUseCase
        self.getAllTagsUseCase = getAllTagsUseCase
    }
    
    func getUserInfo() async throws -> UserInfo {
        return try await getUserInfoUseCase.execute()
    }
    
    func getProducts() async throws -> [Product] {
        return try await getProductsUseCase.execute()
    }
    
    func searchForProduct(searchText: String) async throws -> [Product] {
        return try await searchForProductsUseCase.execute(searchText: searchText)
    }
    
    func getAdvertisements() async throws -> Advertisements {
        return try await getAdvertisementUseCase.execute()
    }
    
    func getAllTags() async throws -> AllTags {
        return try await getAllTagsUseCase.execute()
    }
}
