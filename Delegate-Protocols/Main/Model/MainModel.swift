//
//  MainModel.swift
//  Delegate-Protocols
//
//  Created by Mehmet Kerim ÖZEK on 16.12.2022.
//

import Foundation

// MARK: - PostElement
struct PostElement: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Post = [PostElement]
