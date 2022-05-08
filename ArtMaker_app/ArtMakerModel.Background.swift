//
//  ArtMakerModel.Background.swift
//  ArtMaker_app
//
//  Created by Konstantin Kirillov on 08.05.2022.
//

import Foundation

extension ArtMakerModel {
    enum Background {
        case blank
        case url(URL)
        case imageData(Data)
        
        var url: URL? {
            switch self {
            case .url(let url): return url
            default: return nil
            }
        }
        
        var imageData: Data? {
            switch self {
            case .imageData(let data): return data
            default: return nil
            }
        }
    }
}
