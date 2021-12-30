//
//  ContentView.swift
//  Memorise
//
//  Created by Aman Joshi on 23/12/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
   @ObservedObject var game:EmojiMemoryGame
        
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { (card) in
                    CardView(card: card)
                        .aspectRatio(0.6, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}


struct CardView:View {
    
    var card:EmojiMemoryGame.Card
    
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3.0)
                Text(card.content)
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
            }else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
