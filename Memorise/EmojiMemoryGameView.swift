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
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
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
    
    let card:EmojiMemoryGame.Card
    
    var body: some View {
        
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20.0)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.stroke(lineWidth: 3.0)
                    Text(card.content).font(font(in: geometry.size))
                        .foregroundColor(Color.orange)
                }else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    shape.fill()
                }
            }
        })
    }
    
    private func font(in size:CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.8)
    }
    
    private struct DrawingConstants {
        static let cornerRadius:CGFloat = 20
        static let lineWidth:CGFloat = 3
        static let fontScale:CGFloat = 0.8
    }
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
