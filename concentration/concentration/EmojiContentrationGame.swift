//
//  EmojiMemoryGame.swift
//  View Model
//  concentration
//
//  Created by Amy Lo on 8/13/21.
//

import SwiftUI

class EmojiConcentrationGame: ObservableObject {
    
    static let emojis = ["๐ค", "โ", "๐ฅ", "๐ฆ", "โ", "๐ง", "โ", "๐ฉ", "๐", "โก", "๐จ", "โ", "โ", "๐ฌ", "๐จ", "๐ช", "๐ซ", "๐", "โ", "๐ง", "๐ฆ", "๐", "๐งฃ", "๐งค", "๐"]
    
    static func createGame() -> ConcentrationGame<String>{
        ConcentrationGame<String>(numberOfPairsofCards: 4) {
            pairIndex in emojis[pairIndex]
        }
    }
        
    @Published private var model: ConcentrationGame<String> = createGame()
    
    var cards: Array<ConcentrationGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent(s)
    func choose(_ card: ConcentrationGame<String>.Card){
        objectWillChange.send()
        model.choose(card)
    }
}
