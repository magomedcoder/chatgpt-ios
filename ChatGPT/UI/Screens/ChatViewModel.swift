//
//  ChatViewModel.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import Foundation
import Combine

class ChatViewModel: ObservableObject {
    
    @Published var messages: [MessageModel] = []

    func addMessage(isAI: Bool, message: String){
        messages.append(MessageModel(id: UUID().uuidString, isAI: isAI, message: message))
    }
    
}
