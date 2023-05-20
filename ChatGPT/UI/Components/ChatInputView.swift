//
//  ChatInputView.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import SwiftUI

struct ChatInputView: View {
    
    @EnvironmentObject var vm : ChatViewModel
    @State var text = ""
    @State private var isTyped = false
    @State private var offsetX = 292.0;
    @State private var opacity = 0.0;
    
    var body: some View {
        ZStack(alignment: .leading){
            ZStack{}
                .frame(maxWidth: .infinity, maxHeight: 55)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                    .stroke(.black, lineWidth: 1)
                )
                .padding(.horizontal, -14)
            HStack{
                TextField("Написать сообщение", text: $text)
                    .onChange(of: text) { newValue in
                        withAnimation(.spring()){
                            isTyped = newValue.isEmpty ? false : true
                        }
                    }
                ZStack{
                    Image(systemName: "paperplane.fill")
                        .rotationEffect(Angle(degrees: isTyped ? 0 : 45))
                }
                    .frame(width: 50,height: 50)
                    .foregroundColor(.black)
                    .padding(.trailing, -14)
                    .onTapGesture {
                        if isTyped {
                            vm.addMessage(isAI: false, message: text)
                            text = ""
                        }
                    }
            }
        }
            .frame(height: 50, alignment: .leading)
            .foregroundColor(.black)
            .padding(.horizontal, 14)
            .padding(.horizontal, 14)
            .offset(x: offsetX)
            .opacity(opacity)
            .onAppear{
                withAnimation(.spring().delay(1.58)){
                    opacity = 1
                    offsetX = 0
                }
            }
    }
}

struct ChatInputView_Previews: PreviewProvider {
    static var previews: some View {
        ChatInputView()
            .environmentObject(ChatViewModel())
    }
}
