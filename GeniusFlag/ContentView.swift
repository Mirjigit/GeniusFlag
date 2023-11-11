//
//  ContentView.swift
//  GeniusFlag
//
//  Created by Миржигит Суранбаев on 2/11/23.
//

import SwiftUI

struct  ContentView: View {
    @StateObject var gameSettings = GameSettings()
    
    var body: some View {
        NavigationView{
            if !gameSettings.showingResultView {
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
                        
                        Text("Выберите режим:")
                            .tint(.white)
                            .fontWeight(.bold)
                            .font(.title2)
                        
                        
                        NavigationLink(destination: NormalMode()
                            .navigationBarBackButtonHidden(true)
                        ) {
                            Text("ОБЫЧНЫЙ РЕЖИМ")
                            
                                .fontWeight(.bold)
                                .tint(.black)
                        }
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .overlay(Capsule()
                            .stroke(Gradient(colors: [.red, .green])
                                   ))
                        
                        
                        
                        NavigationLink(destination: EndlessMode()
                            .navigationBarBackButtonHidden(true)
                        ) {
                            Text("БЕСКОНЕЧНЫЙ РЕЖИМ")
                            
                                .fontWeight(.bold)
                                .tint(.black)
                        }
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .overlay(Capsule()
                            .stroke(Gradient(colors: [.red, .green])
                                   ))
                        
                        Spacer()
                            .frame(height: 30)
                    }
                }
            } else {
                ResultView(score: $gameSettings.score)
            }
        }
        .environmentObject(gameSettings) // Предоставление GameSettings всем представлениям в NavigationView
    }
    
}
#Preview {
    ContentView().environmentObject(GameSettings())
}
