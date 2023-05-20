//
//  ChatItemView.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import SwiftUI

struct ChatItemView: View {
    
    @Binding var isAI : Bool
    @Binding var message: String
    @State private var opacityAndScale = 0.0
    @State private var offsetX = 0.0
    
    var body: some View {
        HStack(spacing: 0){
            if(!isAI){
                paddingBalloon
            }
            MessageItem(direction: isAI ? .left : .right) {
                VStack(alignment: .leading, spacing: 7){
                    Text(message)
                        .font(.headline)
                        .fontWeight(.regular)
                }
                .padding(.all, 10)
                .padding(.horizontal)
                .foregroundColor(isAI ? .black : .white)
                .background(isAI ? .white : .blue)
            }
            .scaleEffect(opacityAndScale)
            .opacity(opacityAndScale)
            .offset(x: offsetX)
            if(isAI){
                paddingBalloon
            }
        }
        .onAppear{
            offsetX = isAI ? -229 : 229
            withAnimation(.spring()){
                opacityAndScale = 1
                offsetX = 0
            } 
        }
    }
}

extension ChatItemView {
    var paddingBalloon: some View {
        HStack{}
            .frame(width: 29, height: 14)
            .padding(0)
    }
}

struct ChatItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChatItemView(
            isAI: .constant(true),
            message: .constant("Чат")
        )
    }
}
