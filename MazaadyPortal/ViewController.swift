//
//  ViewController.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            let all = try await asyncCall()
            print("all are: \(all.tags)")
        }
        
    }

    func asyncCall() async throws -> AllTags {
        do {
            return try await NetworkManager.shared.sendRequest(request: AllTagsEndPoints.allTags, responseType: AllTags.self)
        } catch {
            throw error
        }
    }

}

