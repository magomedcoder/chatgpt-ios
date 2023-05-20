//
//  MessageModel.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import Foundation

struct MessageModel: Identifiable {
    var id: String
    var isAI: Bool
    var message: String
}
