//
//  PostManager.swift
//  Delegate-Protocols
//
//  Created by Mehmet Kerim ÖZEK on 16.12.2022.
//

import Foundation

class PostManager {
    
    static let shared = PostManager()
    private init () { }
    
    // MARK: - API https://jsonplaceholder.typicode.com/posts -
    
    func getPosts(complete: @escaping((Post?, String?)->())) {
        
        let url = APIURLs.posts()
        
        NetworkManager.shared.request(type: Post.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
            case .success(let items):
                complete(items, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
}
