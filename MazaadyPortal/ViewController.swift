//
//  ViewController.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = UserProfileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            let all = try await asyncCall()
            print("all are: \(all)")
        }
        
    }

    func asyncCall() async throws -> [Product] {
        do {
            return try await viewModel.searchForProduct(searchText: "bid")
        } catch {
            throw error
        }
    }

}

