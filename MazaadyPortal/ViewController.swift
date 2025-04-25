//
//  ViewController.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import UIKit

// MARK: - AllTags
struct AllTags: Codable {
    let tags: [Tag]
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name: String
}

enum TestEndPoint: EndPointContract {
    case tags
    
    var path: String {
        switch self {
        case .tags:
            NetworkConstants.tags
        }
    }
}
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
            return try await NetworkManager.shared.sendRequest(request: TestEndPoint.tags, responseType: AllTags.self)
        } catch {
            throw error
        }
    }

}

