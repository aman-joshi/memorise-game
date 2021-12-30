//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Aman Joshi on 23/12/21.
//

import SwiftUI

@main
struct MemoriseApp: App {
    
    private let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
