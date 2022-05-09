//
//  ArtMaker_appApp.swift
//  ArtMaker_app
//
//  Created by Konstantin Kirillov on 27.04.2022.
//

import SwiftUI

@main
struct ArtMaker_appApp: App {
    let artMakerViewModel = ArtMakerViewModel()
    
    var body: some Scene {
        WindowGroup {
            ArtMakerDocumentView(artMakerViewModel: artMakerViewModel)
        }
    }
}
