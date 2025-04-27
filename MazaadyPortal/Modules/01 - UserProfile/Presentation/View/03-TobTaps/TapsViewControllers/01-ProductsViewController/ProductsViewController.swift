//
//  ProductsViewController.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import UIKit
import Combine

class ProductsViewController: UIViewController {

    @IBOutlet weak var productsContentTableView: UITableView!
    
    var viewModel: UserProfileViewModel?
    
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productsContentTableView.rowHeight = UITableView.automaticDimension
        productsContentTableView.estimatedRowHeight = 500
        registerCells()
        productsContentTableView.delegate = self
        productsContentTableView.dataSource = self
        
        viewModel?.$advertisements
            .sink { [weak self] advertisements in
                DispatchQueue.main.async {
                    self?.productsContentTableView.reloadData()
                }
            }
            .store(in: &cancellables)
    }
    
    
    private func registerCells() {
        // Register SearchBar table view cell
        productsContentTableView.register(UINib(nibName: "CustomSearchBarTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomSearchBarTableViewCell")
        productsContentTableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductsTableViewCell")
        // Register advertisements table view cell
        productsContentTableView.register(UINib(nibName: "AdvertisementsTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvertisementsTableViewCell")
        // Register tags table view cell
        productsContentTableView.register(UINib(nibName: "AllTagsTableViewCell", bundle: nil), forCellReuseIdentifier: "AllTagsTableViewCell")
    }

}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            // for search
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSearchBarTableViewCell", for: indexPath) as? CustomSearchBarTableViewCell else {
                return UITableViewCell()
            }
            // configure
            return cell
        case 1:
            // for products
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as? ProductsTableViewCell else {
                return UITableViewCell()
            }
            // configure
            cell.setupProducts(products: viewModel?.allProducts ?? [])
            return cell
        case 2:
            // for ads
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertisementsTableViewCell", for: indexPath) as? AdvertisementsTableViewCell else {
                return UITableViewCell()
            }
            // configure
            cell.initAdds(adds: viewModel?.advertisements?.advertisements ?? [])
            return cell
        default:
            // for tags
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllTagsTableViewCell", for: indexPath) as? AllTagsTableViewCell else {
                return UITableViewCell()
            }
            // configure
            cell.setupViews(allTags: viewModel?.allTags?.tags ?? [])
            return cell
        }
    }
}
