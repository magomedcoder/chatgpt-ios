//
//  ChatView.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import SwiftUI

struct ChatView: View {

    @StateObject var vm = ChatViewModel()
 
    var body: some View {
        ZStack{
            VStack{
                ChatHeaderView()
                ScrollView{
                    ScrollViewReader { proxy in
                        VStack(alignment: .leading){
                            ForEach($vm.messages, id: \.id) { message in
                                ChatItemView(
                                    isAI: message.isAI,
                                    message:message.message).id(message.id
                                )
                            }
                        }
                        .padding()
                    }
                }
                ChatInputView()
                    .padding(.bottom,14)
                    .environmentObject(vm)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
