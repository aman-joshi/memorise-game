//
//  MemoriseGame.swift
//  Memorise
//
//  Created by Aman Joshi on 26/12/21.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards:Array<Card>
    
    
    mutating func choose(_ card:Card) {
        let chosenIndex = index(of:card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card:Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
       return 0
    }
    
    init(numberOfPairCards:Int, createCardContent:(Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairCards = 2x cards to cards array
        for pairIndex in 0..<numberOfPairCards {
            let cardContent:CardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent, id: pairIndex*2))
            cards.append(Card(content: cardContent, id: (pairIndex*2)+1))
        }
    }
    
    struct Card:Identifiable {
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
        var id: Int
    }
}