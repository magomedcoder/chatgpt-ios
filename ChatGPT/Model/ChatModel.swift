//
//  ChatModel.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import Foundation

struct ChatModel: Codable {
    let id: String
    let object: String
    let created: Int
    let choices: [Choice]
}

struct Choice: Codable {
    let index: Int
    let message: Message
}

struct Message: Codable {
    let role: String
    let content: String
}
