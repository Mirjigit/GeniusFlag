//
//  EndlessMode.swift
//  GeniusFlag
//
//  Created by Миржигит Суранбаев on 6/11/23.
//

import SwiftUI

struct EndlessMode: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var countries = Countries.countries.shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    
    @State private var score = 0
    
    @State private var scoreTitle = ""
    
    @State private var showResultView = false
    
    //ResultView(score: $score)
    
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
                                    .font(.system(size: 16))
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
                                        .font(.system(size: 16))
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
                                        .font(.system(size: 16))
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
                    
                    NavigationLink(destination: ResultView(score: $score), isActive: $showResultView) { EmptyView() }
                }
                ForEach(0..<3) { number in
                    Button {
                        self.flagTapped(number)
                        // self.showingScore = true
                    } label: {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 4)
                    }
                }
                //                Text("Общий счет: \(score)")
                //                    .font(.title)
                //                    .fontWeight(.black)
                Spacer()
            }
            
            
        }
        
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Правильный ответ!"
            score += 1
            askQuestion()
        }
        else {
            //self.showingScore = true
            showResultView = true
        }
    }
    
}









#Preview {
    EndlessMode()
}
