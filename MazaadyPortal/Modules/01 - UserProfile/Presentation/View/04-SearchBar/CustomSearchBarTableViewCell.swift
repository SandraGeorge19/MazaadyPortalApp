//
//  CustomSearchBarTableViewCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import UIKit

class CustomSearchBarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    // Closure to trigger when search button tapped
    var onSearchButtonTapped: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViewUI()
    }
    
    func setupViewUI() {
        containerView.setBorderAndCornerRadius(borderColor: UIColor(hex: "#F1F1F6"), cornerRadius: 10)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc private func searchButtonTapped() {
        let text = searchTextField.text ?? ""
        onSearchButtonTapped?(text)
    }
    
    func clearText() {
        searchTextField.text = ""
    }
}
