//
//  ArtMakerDocumentView.swift
//  ArtMaker_app
//
//  Created by Konstantin Kirillov on 27.04.2022.
//

import SwiftUI

struct ArtMakerDocumentView: View {
    @ObservedObject var artMakerViewModel: ArtMakerViewModel
    
    let testEmojis = "🤥😐🥴🤖😿💩🤡😹👾🤠👿"
    let defaultsEmojisFontSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 0) {
            documentBody
            palette
        }
    }
    
    var documentBody: some View {
        ZStack {
            Color.yellow
            ForEach(artMakerViewModel.emojis) { emoji in
                Text(emoji.text)
                    .font(.system(size: fontSize(for: emoji)))
                    //.position(position(for emoji))
            }
        }
    }
    
    var palette: some View {
        ScrollingEmojisView(emojis: testEmojis)
            .font(.system(size: defaultsEmojisFontSize))
    }
    
    struct ScrollingEmojisView: View {
        let emojis: String
     
        var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(emojis.map({ String($0) }), id: \.self) { emoji in
                        Text(emoji)
                    }
                }
                
            }
        }
    }
    
    private func fontSize(for emoji: ArtMakerModel.Emoji) -> CGFloat {
        CGFloat(emoji.size)
    }
    
    private func position(for emoji: ArtMakerModel.Emoji) -> CGPoint {
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArtMakerDocumentView(artMakerViewModel: ArtMakerViewModel())
.previewInterfaceOrientation(.portrait)
    }
}
