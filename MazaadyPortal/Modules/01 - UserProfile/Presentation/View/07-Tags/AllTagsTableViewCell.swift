//
//  AllTagsTableViewCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import UIKit

class AllTagsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    
    private var allTags: [Tag]?
    private var selectedIndexPaths: Set<IndexPath> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViewUI()
    }
    
    func setupViews(allTags: [Tag]) {
        self.allTags = allTags
        tagsCollectionView.reloadData()
    }
    
    private func setupViewUI() {
        setupSectionTitle()
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        
        tagsCollectionView.collectionViewLayout = layout
        
        tagsCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")

        
        tagsCollectionView.dataSource = self
        tagsCollectionView.delegate = self
    }
    
    private func setupSectionTitle() {
        self.sectionTitle.text = "Top Tags"
        self.sectionTitle.font = UIFont.nunitoFont(size: 18, weight: .bold)
        self.sectionTitle.textColor = UIColor.black
    }
    
}

extension AllTagsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTags?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as? TagCollectionViewCell else {
            return UICollectionViewCell()
        }

        let isSelected = selectedIndexPaths.contains(indexPath)
        cell.configure(with: allTags?[indexPath.row], isSelected: isSelected)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedIndexPaths.contains(indexPath) {
            selectedIndexPaths.remove(indexPath)
        } else {
            selectedIndexPaths.insert(indexPath)
        }
        collectionView.reloadItems(at: [indexPath])
    }
}
