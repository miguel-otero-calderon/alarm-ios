//
//  Song.swift
//  alarm-ios
//
//  Created by Miguel on 11/07/22.
//

import Foundation
import UIKit

struct Song {
    let identifier: String
    let name: String
    let isList: Bool
    let source: Song.Source
    let image: UIImage?
    let group: Song.Group
    let author: String?
    var state: Song.State
    
    init(identifier: String, name: String, isList: Bool, source: Song.Source, image: UIImage?, group: Song.Group, author: String? = nil, state: Song.State = .normal) {
        self.identifier = identifier
        self.name = name
        self.isList = isList
        self.source = source
        self.image = image
        self.group = group
        self.author = author
        self.state = state
    }
    
    enum Source {
        case local
        case spotify
        case apple
        
        func getDescription() -> String {
            switch self {
            case .local:
                return Localizable.local
            case .spotify:
                return Localizable.spotify
            case .apple:
                return Localizable.apple
            }
        }
    }
    
    enum Group {
        case classic
        case ringtone
        
        func getDescription() -> String {
            switch self {
            case .classic:
                return Localizable.classic
            case .ringtone:
                return Localizable.ringtone
            }
        }
    }
    
    enum State {
        case normal
        case play
        case pause
    }
}
