//
//  AdvertisementsTableViewCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import UIKit

class AdvertisementsTableViewCell: UITableViewCell {

    @IBOutlet weak var addsTableView: UITableView!
    
    private var adds: [Advertisement]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addsTableView.rowHeight = UITableView.automaticDimension
        addsTableView.estimatedRowHeight = CGFloat(adds?.count ?? 0) * 147
        registerCell()
        addsTableView.delegate = self
        addsTableView.dataSource = self
    }
    
    func initAdds(adds: [Advertisement]) {
        self.adds = adds
        print("adds are: \(adds)")
        addsTableView.reloadData()
    }
    
    private func registerCell() {
        addsTableView.register(UINib(nibName: "AdsCell", bundle: nil), forCellReuseIdentifier: "AdsCell")
    }
}

extension AdvertisementsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adds?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdsCell", for: indexPath) as? AdsCell else {
            return UITableViewCell()
        }
        // configure
        cell.setupAdsImage(with: adds?[indexPath.row].image ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
