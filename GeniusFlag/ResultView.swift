//
//  ResultView.swift
//  GeniusFlag
//
//  Created by Миржигит Суранбаев on 8/11/23.
//

import SwiftUI

struct ResultView: View {
    @Binding var score: Int

    var body: some View {
        NavigationView{
            ZStack(){
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack(){
                    Spacer()
                    Image("logo_fg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                    
                    Spacer(minLength: 20)
                    
                    Text("Игра окончена")
                        .tint(.white)
                        .fontWeight(.bold)
                        .font(.title3)
                    
                    Text("Ваш счет: \(score)")
                }
            }
        }
    }
}

#Preview {
    ResultView(score: .constant(5))
}
