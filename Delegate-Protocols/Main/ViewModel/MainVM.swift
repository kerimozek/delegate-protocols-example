//
//  MainVM.swift
//  Delegate-Protocols
//
//  Created by Mehmet Kerim ÖZEK on 16.12.2022.
//

import Foundation


protocol MainDelegate: AnyObject {
    func didGetPosts(isDone: Bool)
}

class MainVM {
    
    weak var delegate: MainDelegate?
    static let shared = MainVM()
//    private init () { }
    
    var post: [PostElement] = []
    
    
    func getPosts(complete: @escaping((String?)->())) {
        PostManager.shared.getPosts { items, errorMessage in
            
            if let items = items {
                self.post = items
                self.delegate?.didGetPosts(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetPosts(isDone: false)
        }
    }
}

