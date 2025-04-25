//
//  UserInfoTableViewCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import UIKit
import SDWebImage

class UserInfoTableViewCell: UITableViewCell {
    // MARK: - IBOutlet(s)
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var followersView: FollowView!
    @IBOutlet weak var followingView: FollowView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupViews(with model: UserInfo?) {
        setupUserImage(with: model?.image ?? "")
        setupName(profileName: model?.name ?? "")
        setupUserName(profileUserName: model?.userName ?? "")
        setupUserLocation(country: model?.countryName ?? "", city: model?.cityName ?? "")
        setupFollowsViews(followers: model?.followersCount ?? 0, following: model?.followingCount ?? 0)
    }
    
    private func setupUserImage(with urlString: String) {
        userImage.sd_setImage(
            with: URL(string: urlString),
            placeholderImage: UIImage(named: "user_placeholder"),
            context: nil
        )
        userImage.layer.cornerRadius = 18
        userImage.clipsToBounds = true
    }
    
    private func setupName(profileName: String) {
        name.text = profileName
        name.font = UIFont.nunitoFont(size: 18, weight: .bold)
        name.textColor = .black
    }
    
    private func setupUserName(profileUserName: String) {
        userName.text = profileUserName
        userName.font = UIFont.nunitoFont(size: 14, weight: .regular)
        userName.textColor = .black
    }
    
    private func setupUserLocation(country: String, city: String) {
        userLocation.text = "\(country), \(city)"
        userLocation.font = UIFont.nunitoFont(size: 12, weight: .regular)
        userLocation.textColor = UIColor(hex: "#A8A4A4")
    }
    
    private func setupFollowsViews(followers: Int, following: Int) {
        followingView.setupViews(iconName: "ic_following", numOfFollows: following, followTitle: "Following")
        followersView.setupViews(iconName: "ic_follower", numOfFollows: followers, followTitle: "Followers")
    }
}
