//
//  ArtMakerMoodel.swift
//  ArtMaker_app
//
//  Created by Konstantin Kirillov on 06.05.2022.
//

import Foundation

struct ArtMakerModel {
    var background = Background.blank
    var emojis = [Emoji]()
    private var uniqueEmojiId = 0
    
    init() {}
    
    
    struct Emoji: Identifiable, Hashable {
        let text: String
        var x: Int //offset from center
        var y: Int //offset from center
        var size: Int
        let id: Int
        
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
        
    }
    
    mutating func addEmoji(_ text: String, at location: (x: Int, y: Int), size: Int) {
        uniqueEmojiId += 1
        emojis.append(Emoji(text: text,
                            x: location.x,
                            y: location.y,
                            size: size,
                            id: uniqueEmojiId))
    }
}
