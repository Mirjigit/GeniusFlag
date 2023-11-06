//
//  StartView.swift
//  GeniusFlag
//
//  Created by Миржигит Суранбаев on 2/11/23.
//

import SwiftUI

struct StartView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var countries = ["UK","USA","Bangladesh", "Germany", "Argentina", "Brazil", "Canada", "Greece", "Russia", "Sweden"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.orange, .purple]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 50){
                VStack()
                {
                    HStack(alignment: .center, spacing: 70){
                        
                        Button{
                            // Exit
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            VStack{
                                Image(systemName: "xmark")
                                    .tint(.white)
                                Text("выйти")
                                    .tint(.white)
                            }
                        }
                        .frame(width: 60, height: 60)
                        .background(.black.opacity(0.4))
                        .cornerRadius(10)
                        
                        Button{ // Timer
                        } label: {
                            ZStack{
                                VStack{
                                    Text("СЧЕТ")
                                        .tint(.white)
                                    Text("\(score)")
                                        .tint(.white)
                                        .font(.system(size: 25))
                                }
                            }
                        }
                        .frame(width: 60, height: 60)
                        .background(.black.opacity(0.4))
                        .cornerRadius(10)
                        
                        Button{ // Score
                        } label: {
                            ZStack{
                                VStack{
                                    Text("СЧЕТ")
                                        .tint(.white)
                                    Text("\(score)")
                                        .tint(.white)
                                        .font(.system(size: 25))
                                }
                            }
                        }
                        .frame(width: 60, height: 60)
                        .background(.black.opacity(0.4))
                        .cornerRadius(10)
                        
                        
                    }
                    
                    Text("Выберите флаг")
                        .foregroundStyle(.white)
                        .font(.headline)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                ForEach(0..<3) { number in
                    Button {
                        self.flagTapped(number)
                    } label: {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .frame(width: 250, height: 130)
                            .clipShape(Capsule())
                                .overlay(Capsule()
                                    .stroke(Color.black, lineWidth: 1))
                                .shadow(color: .black, radius: 4)
                    }
                }
                /* Text("Общий счет: \(score)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                */
                Spacer()
            }
        }
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Правильный ответ"
            score += 1
            
        }
        else{
            scoreTitle = "Неправильно! Это флаг \(countries[number])"
            score -= 1
        }
        askQuestion()
    }
}
















#Preview {
    StartView()
}
