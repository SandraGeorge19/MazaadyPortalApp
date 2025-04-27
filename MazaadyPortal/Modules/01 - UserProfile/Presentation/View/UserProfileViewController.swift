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
        view.layer.backgroundColor = UIColor(hex: "#F6F4F5").cgColor
        homeTableView.layer.backgroundColor = UIColor.black.cgColor
        
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 70
        registerCells()
        homeTableView.delegate = self
        homeTableView.dataSource = self
       
        viewModel.$advertisements
            .combineLatest(viewModel.$userInfo, viewModel.$allProducts, viewModel.$allTags)
            .sink { [weak self] advertisements, userInfo, allProducts, allTags in
                DispatchQueue.main.async {
                    self?.homeTableView.reloadData()
                }
            }
            .store(in: &cancellables)
        Task {
            do {
                try await viewModel.getUserInfo()
                try await viewModel.getProducts()
                try await viewModel.getAdvertisements()
                try await viewModel.getAllTags()
            } catch {
                print("Error fetching user info or advertisements: \(error)")
            }
        }
        
    }
    
    private func registerCells() {
        // Register language table view cell
        homeTableView.register(UINib(nibName: "LanguageTableViewCell", bundle: nil), forCellReuseIdentifier: "LanguageTableViewCell")
        // Register user info table view cell
        homeTableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "UserInfoTableViewCell")
        // Register taps table view cell
        homeTableView.register(UINib(nibName: "TobTapsTableViewCell", bundle: nil), forCellReuseIdentifier: "TobTapsTableViewCell")
    }
}


extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TobTapsTableViewCell", for: indexPath) as? TobTapsTableViewCell else {
                return UITableViewCell()
            }
            // configure
            cell.setupProducts(viewModel: viewModel)
            cell.configure(parent: self)
            return cell
        }
    }
}
