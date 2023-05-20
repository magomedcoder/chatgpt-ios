//
//  ChatHeaderView.swift
//  ChatGPT
//
//  Created by Magomedcoder on 20.05.2023.
//

import SwiftUI

struct ChatHeaderView: View {
    
    @State private var offsetY = -72.0;
    @State private var opacity = 0.0;
    
    var body: some View {
        HStack{
            Text("ChatGPT").font(.title2)
        }
        .padding(.horizontal,14)
        .frame(height: 55)
        .background(.white)
        .opacity(opacity)
        .offset(y: offsetY)
        .onAppear{
            withAnimation(.spring()){
                opacity = 1
                offsetY = 0
            }
        }
    }
        
}

struct ChatHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHeaderView()
    }
}
