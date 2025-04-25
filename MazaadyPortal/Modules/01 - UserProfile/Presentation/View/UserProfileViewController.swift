//
//  UserProfileViewController.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import UIKit
import Combine

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    private let viewModel = UserProfileViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 70
        registerCells()
        homeTableView.delegate = self
        homeTableView.dataSource = self
       
        viewModel.$advertisements
            .combineLatest(viewModel.$userInfo)
            .sink { [weak self] advertisements, userInfo in
                DispatchQueue.main.async {
                    // Reload only when both userInfo and advertisements are available
                    self?.homeTableView.reloadData()
                }
            }
            .store(in: &cancellables)
        Task {
            do {
                try await viewModel.getUserInfo()
                try await viewModel.getAdvertisements()
            } catch {
                print("Error fetching user info or advertisements: \(error)")
            }
        }
//        
//        viewModel.$advertisements
//            .sink { [weak self] adds in
//                // Update your view or reload tableView when userInfo changes
//                DispatchQueue.main.async {
//                    // Update your view or reload tableView when userInfo changes
//                    self?.homeTableView.reloadData()
//                }
//            }
//            .store(in: &cancellables)
//        viewModel.$userInfo
//            .sink { [weak self] userInfo in
//                // Update your view or reload tableView when userInfo changes
//                DispatchQueue.main.async {
//                    // Update your view or reload tableView when userInfo changes
//                    self?.homeTableView.reloadData()
//                }
//            }
//            .store(in: &cancellables)
        
    }
    
    private func registerCells() {
        // Register language table view cell
        homeTableView.register(UINib(nibName: "LanguageTableViewCell", bundle: nil), forCellReuseIdentifier: "LanguageTableViewCell")
        // Register user info table view cell
        homeTableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "UserInfoTableViewCell")
        // Register advertisements table view cell
        homeTableView.register(UINib(nibName: "AdvertisementsTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvertisementsTableViewCell")
    }
    
    func asyncCall() async throws -> [Product] {
        do {
            return try await viewModel.searchForProduct(searchText: "bid")
        } catch {
            throw error
        }
    }
    
}


extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as? LanguageTableViewCell else {
                return UITableViewCell()
            }
            // configure
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as? UserInfoTableViewCell else {
                return UITableViewCell()
            }
            // configure
            cell.setupViews(with: viewModel.userInfo)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as? LanguageTableViewCell else {
                return UITableViewCell()
            }
            // configure
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as? LanguageTableViewCell else {
                return UITableViewCell()
            }
            // configure
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as? LanguageTableViewCell else {
                return UITableViewCell()
            }
            // configure
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertisementsTableViewCell", for: indexPath) as? AdvertisementsTableViewCell else {
                return UITableViewCell()
            }
            // configure
            cell.initAdds(adds: viewModel.advertisements?.advertisements ?? [])
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as? LanguageTableViewCell else {
                return UITableViewCell()
            }
            // configure
            return cell
        }
    }
}
