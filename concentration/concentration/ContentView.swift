//
//  ContentView.swift
//  Memorize
//
//  Created by Amy Lo on 7/16/21.
//

import SwiftUI

// structs are not object oriented
// :View defines that the struct acts as a view
// Views are made out of smaller views
// A view is just a rectangular area on screen
// Swift is a functional programming language

// @ State is how the UI is managing itself

// observable projects use @ pubish
// toggle - don't need anywhere else @state
// global variable that is acccessed - view model - use @ Publish
// @ state are in your view as a private var

// @ state - if you're in content view for a modal - @State private var
// inside the lcass
// if if's in an observable object - use public @ publish
// tutorial - MMVM - goes into signup

// Show a different number of cards and chooses between three sets of arrays (weather, vehicles, faces)
struct ContentView: View {
    @ObservedObject var viewModel: EmojiConcentrationGame

    var body: some View{
        
        VStack{
            Text("Concentration")
                .font(.title)
            
            ScrollView{
                // random number of cards
//                let emojiCount = Int.random(in: 8...(emojis.count - 1))
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards) {
                        card in CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }.foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct CardView: View{
    var card: ConcentrationGame<String>.Card
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

// This is the content preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiConcentrationGame()
        ContentView(viewModel: game)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
