//
//  ArtMakerViewModel.swift
//  ArtMaker_app
//
//  Created by Konstantin Kirillov on 08.05.2022.
//

import SwiftUI

class ArtMakerViewModel: ObservableObject {
    var emojis: [ArtMakerModel.Emoji] {
        artMaker.emojis
    }
    
    var background: ArtMakerModel.Background {
        artMaker.background
    }
    
    @Published private(set) var artMaker: ArtMakerModel
    
    init() {
        artMaker = ArtMakerModel()
    }
    
    //MARK: - Intents
    func setBacground(_ bacground: ArtMakerModel.Background) {
        artMaker.background = bacground
    }
    
    func addEmoji(_ emoji: String, at location: (x: Int, y: Int), size: Int) {
        artMaker.addEmoji(emoji, at: location, size: size)
    }
    
    func moveEmoji(_ emoji: ArtMakerModel.Emoji, by offset: CGSize) {
        if let index = artMaker.emojis.index(matching: emoji) {
            artMaker.emojis[index].x += Int(offset.width)
            artMaker.emojis[index].y += Int(offset.height)
        }
    }
    
    func scaleEmoji(_ emoji: ArtMakerModel.Emoji, by scale: CGFloat) {
        if let index = artMaker.emojis.index(matching: emoji) {
            artMaker.emojis[index].size = Int((CGFloat(artMaker.emojis[index].size) * scale).rounded(.toNearestOrAwayFromZero))
        }
    }
    
}
