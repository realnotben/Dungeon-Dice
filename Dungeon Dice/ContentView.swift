//
//  ContentView.swift
//  Dungeon Dice
//
//  Created by FIGUEROA, BENJAMIN on 2/10/26.
//

import SwiftUI

struct ContentView: View {
    
    enum Dice: Int, CaseIterable, Identifiable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        var id: Int{
             rawValue // Each rawValue is unique, so its a good ID
        }
        
        var description: String {"\(rawValue)-sided"}
        
        
        func roll() -> Int{
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    @State private var resultMessage = ""
    @State private var animationTrigger = false
    @State private var isDoneAnimating = true
   
    var body: some View {
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.red)
               
            Spacer()
            
            Text(resultMessage)
                .font(.largeTitle)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
//                .scaleEffect(isDoneAnimating ? 1.0 : 0.6)
//                .opacity(isDoneAnimating ? 1.0 : 0.2)
                .rotation3DEffect(isDoneAnimating ? .degrees(360) : .degrees(0), axis:(x:1, y:0, z:0))
                .frame(height: 150)
                .onChange(of: animationTrigger) {
                    isDoneAnimating = false
                    withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.4)) {
                        isDoneAnimating = true
                    }
                }
            
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))])
            { ForEach(Dice.allCases) { dice in
                Button(dice.description) {
                resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                    animationTrigger.toggle()
            }
            }
        .buttonStyle(.borderedProminent)
        .tint(.red)}
            
        
            
            
//            Group {
//                HStack {
//                    Button("\(Dice.four.rawValue)-sided") {
//                        resultMessage = "You rolled a \(Dice.four.roll()) on a \(Dice.four.rawValue)-sided dice"
//                    }
//
//                    Spacer()
//                    Button("\(Dice.six.rawValue)-sided") {
//                        resultMessage = "You rolled a \(Dice.six.roll()) on a \(Dice.six.rawValue)-sided dice" }
//                    Spacer()
//                    Button("\(Dice.eight.rawValue)-sided") {
//                        resultMessage = "You rolled a \(Dice.eight.roll()) on a \(Dice.eight.rawValue)-sided dice"
//                    }
//
//
//                }
//                HStack {
//                    Button("\(Dice.ten.rawValue)-sided") {
//                        resultMessage = "You rolled a \(Dice.ten.roll()) on a \(Dice.ten.rawValue)-sided dice"
//                    }
//
//                    Spacer()
//                    Button("\(Dice.twelve.rawValue)-sided") {
//                        resultMessage = "You rolled a \(Dice.twelve.roll()) on a \(Dice.twelve.rawValue)-sided dice" }
//                    Spacer()
//                    Button("\(Dice.twenty.rawValue)-sided") {
//                        resultMessage = "You rolled a \(Dice.twenty.roll()) on a \(Dice.twenty.rawValue)-sided dice"
//                    }
//
//                }
//                Button("\(Dice.hundred.rawValue)-sided") {
//                    resultMessage = "You rolled a \(Dice.hundred.roll()) on a \(Dice.hundred.rawValue)-sided dice"}
//
//            }
//            .buttonStyle(.borderedProminent)
//            .tint(.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
