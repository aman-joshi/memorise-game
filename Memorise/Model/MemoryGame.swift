//
//  MemoriseGame.swift
//  Memorise
//
//  Created by Aman Joshi on 26/12/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    
    var cards:Array<Card>
    
    private var indexOfOnlyOneAndOnlyFaceUpCard:Int? {
        let faceupCardIndices = cards.indices.filter { cards[$0].isFaceUp }
        return faceupCardIndices.count == 1 ? faceupCardIndices.first : nil
    }
    
    mutating func choose(_ card:Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfOnlyOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
            }else {
                cards.indices.forEach { cards[$0].isFaceUp = false }
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    
    init(numberOfPairCards:Int, createCardContent:(Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairCards {
            let cardContent:CardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent, id: pairIndex*2))
            cards.append(Card(content: cardContent, id: (pairIndex*2)+1))
        }
    }
    
    struct Card:Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content:CardContent
        let id: Int
    }
}
