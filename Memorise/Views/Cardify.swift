//
//  Cardify.swift
//  Memorise
//
//  Created by Aman Joshi on 12/01/22.
//

import SwiftUI

struct Cardify:ViewModifier {
    let isFaceUp:Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: DrawingConstants.lineWidth)
              content
            }
            else {
                shape.fill()
            }
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius:CGFloat = 10
        static let lineWidth:CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp:Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
