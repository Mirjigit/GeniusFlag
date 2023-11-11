//
//  StartView.swift
//  GeniusFlag
//
//  Created by Миржигит Суранбаев on 2/11/23.
//

import SwiftUI
import Combine

struct NormalMode: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var countries = Countries.countries.shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    
    @State private var scoreTitle = ""
    
    @State private var timeRemaining = 30
    
    @State private var questionsAsked = 0
    
    let maxQuestions = 15
    
    @State private var showResultView = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
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
                                    Text("ВРЕМЯ")
                                        .tint(.white)
                                    Text("\(timeRemaining)")
                                        .tint(.white)
                                        .font(.system(size: 22))
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
                                    Text("15/\(score)")
                                        .tint(.white)
                                        .font(.system(size: 22))
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
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 4)
                    }
                }
                Spacer()
            }
            if showResultView {
                ResultView(score: $score)
            }
        }
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
            if self.timeRemaining == 0 || self.questionsAsked == self.maxQuestions {
                self.showResultView = true
                self.timer.upstream.connect().cancel()
            }
        }
        .onAppear {
            self.askQuestion()
        }
        .onDisappear() {
            self.timer.upstream.connect().cancel()
        }
        
    }
    func askQuestion(){
        if self.questionsAsked < self.maxQuestions {
            self.countries.shuffle()
            self.correctAnswer = Int.random(in: 0...2)
            self.questionsAsked += 1
        } else {
            self.showResultView = true
            self.timer.upstream.connect().cancel()
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            score += 1
        }
        if questionsAsked >= maxQuestions || timeRemaining == 0 {
            showResultView = true
            self.timer.upstream.connect().cancel()
        } else {
            askQuestion()
        }
    }
}
















#Preview {
    NormalMode()
}
