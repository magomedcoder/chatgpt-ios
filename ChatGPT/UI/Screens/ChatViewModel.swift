//
//  ChatViewModel.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import Foundation
import Combine

class ChatViewModel: ObservableObject {
    
    private let openAIAPI = OpenAIAPI()
    @Published var messages: [MessageModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    func sendRequest(prompt: String) {
        openAIAPI.chat(prompt: prompt)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] value in
                self?.addMessage(isAI: true, message: value)
            })
            .store(in: &cancellables)
    }

    
    func addMessage(isAI: Bool, message: String){
        messages.append(MessageModel(id: UUID().uuidString, isAI: isAI, message: message))
        if !isAI{
            sendRequest(prompt: message)
        }
    }
    
}
