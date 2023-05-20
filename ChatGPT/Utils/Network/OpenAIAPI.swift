//
//  OpenAIAPI.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import Foundation
import Combine

class OpenAIAPI {
    
    private let endpoint = "https://api.openai.com"
    private let token = ""
    
    func chat(prompt: String) -> AnyPublisher<String, Error> {
        let messageModel = ["role": "user", "content": prompt]
        let parameters = ["model": "gpt-3.5-turbo", "messages": [messageModel]] as [String : Any]
        var request = URLRequest(url: URL(string: endpoint + "/v1/chat/completions")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: ChatModel.self, decoder: JSONDecoder())
            .map { $0.choices[0].message.content }
            .eraseToAnyPublisher()
    }
    
}
