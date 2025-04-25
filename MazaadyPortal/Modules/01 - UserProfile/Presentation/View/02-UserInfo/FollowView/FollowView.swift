//
//  FollowView.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import UIKit

class FollowView: UIView {
    // MARK: - IBOutlet(s)
    @IBOutlet weak var followIcon: UIImageView!
    @IBOutlet weak var numOfFollows: UILabel!
    @IBOutlet weak var followTitle: UILabel!
    
    // MARK: - Init(s)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.xibSetup()
    }
    
    func setupViews(iconName: String, numOfFollows: Int, followTitle: String) {
        setupFollowIcon(iconName: iconName)
        setupNumOfFollows(followNumber: numOfFollows)
        setupFollowTitle(title: followTitle)
    }
    
    private func setupFollowIcon(iconName: String) {
        followIcon.image = UIImage(named: iconName)
    }
    
    private func setupNumOfFollows(followNumber: Int) {
        numOfFollows.text = "\(followNumber)"
        numOfFollows.font = UIFont.nunitoFont(size: 14)
        numOfFollows.textColor = .black
    }
    
    private func setupFollowTitle(title: String) {
        followTitle.text = title
        followTitle.font = UIFont.nunitoFont(size: 12)
        followTitle.textColor = UIColor(hex: "#D20653")
    }
}
