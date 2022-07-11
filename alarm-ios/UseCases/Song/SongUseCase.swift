//
//  SongUseCase.swift
//  alarm-ios
//
//  Created by Miguel on 23/07/22.
//

import Foundation
import UIKit

struct SongUseCase {
    //variable
    //public
    static func getSongDefault() -> [Song] {
        let songs = [
            Song(identifier: "",
                 name: "",
                 isList: false,
                 source: .local,
                 image: nil,
                 group: .classic,
                 author: "")
        ]
        return songs
    }
    //private
}
