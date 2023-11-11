//
//  ResultView.swift
//  GeniusFlag
//
//  Created by Миржигит Суранбаев on 8/11/23.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var score: Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            ZStack(){
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack(){
                    Spacer()
                        .frame(height: 50)
                    Image("logo_fg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    
                    Spacer(minLength: 20)
                    
                    VStack{
                            
                            Text("Игра окончена!")
                            .foregroundStyle(.black)
                            .fontWeight(.light)
                                .font(.title)
                                .padding(.bottom, 20)
                            
                            Text("Ваш счет: \(score)")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.title)
                        
                    }
                    .frame(width: 300, height: 250)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Gradient(colors: [.red, .green])))
                    .shadow(color: .black, radius: 2)
                    
                    Spacer(minLength: 20)
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "house")
                                .tint(.black)
                            Text("ДОМОЙ")
                                .fontWeight(.bold)
                                .tint(.black)
                        }
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .overlay(Capsule()
                            .stroke(Gradient(colors: [.red, .green])
                                   ))
                        
                        
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ResultView(score: .constant(5))
}
