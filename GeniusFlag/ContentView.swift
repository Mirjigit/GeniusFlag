//
//  ContentView.swift
//  GeniusFlag
//
//  Created by Миржигит Суранбаев on 2/11/23.
//

import SwiftUI

struct  ContentView: View {
    
    var body: some View {
        NavigationView{
            ZStack(){
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.red]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                VStack(){
                    Spacer()
                    Image("logo_fg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                    
                    
                    Spacer(minLength: 20)
                    
                    NavigationLink(destination: StartView()
                        .navigationBarBackButtonHidden(true)
                    ) {
                        Text("НАЧАТЬ ИГРУ")
                        
                            .fontWeight(.bold)
                            .tint(.black)
                    }
                    .frame(width: 200, height: 50)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .overlay(Capsule()
                        .stroke(Gradient(colors: [.red, .green])
                               ))
                    
                    Spacer()
                        .frame(height: 30)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
