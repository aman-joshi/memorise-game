//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Aman Joshi on 26/12/21.
//

import SwiftUI

class EmojiMemoryGame:ObservableObject {
    
   static let emojis = ["🚛","🚌","🚘","🚓","🛻","🛵","🛺","🏎","🚑","🚔","🚍","🚖","🚡","🚠","🚞","🚆","🚇","🚊","✈️","🚀","🚁","⛵️","🚤","🛳"]
    
    static func createMemoryGame () -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairCards: 3) { pairIndex in
            emojis[pairIndex]
        }
    }
    
   @Published private var model:MemoryGame<String> = createMemoryGame()
    
    var cards:Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card:MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
