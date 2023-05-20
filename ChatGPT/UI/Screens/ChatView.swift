//
//  ChatView.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack{
            VStack{
                ChatHeaderView()
                ScrollView{
                    ScrollViewReader { proxy in
                        VStack(alignment: .leading){

                        }
                        .padding()
                    }
                }
                ChatInputView()
                    .padding(.bottom,14)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
