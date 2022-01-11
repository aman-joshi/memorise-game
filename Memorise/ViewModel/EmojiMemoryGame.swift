//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Aman Joshi on 26/12/21.
//

import SwiftUI

class EmojiMemoryGame:ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚛","🚌","🚘","🚓","🛻","🛵","🛺","🏎","🚑","🚔","🚍","🚖","🚡","🚠","🚞","🚆","🚇","🚊","✈️","🚀","🚁","⛵️","🚤","🛳"]
    
    private static func createMemoryGame () -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
   @Published private var model = createMemoryGame()
    
    var cards:Array<Card> {
        model.cards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card:Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
