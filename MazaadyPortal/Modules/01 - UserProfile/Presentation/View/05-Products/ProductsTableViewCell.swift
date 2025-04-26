//
//  ProductsTableViewCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    private var products: [Product]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViewsUI()
    }
    
    func setupProducts(products: [Product]) {
        self.products = products
        print("all products are: \(products)")
        productsCollectionView.reloadData()
    }
    
    private func setupViewsUI() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        
        productsCollectionView.collectionViewLayout = layout
        
        productsCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")

        
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
        
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
    }
}

extension ProductsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: products?[indexPath.row])
        return cell
    }
}
