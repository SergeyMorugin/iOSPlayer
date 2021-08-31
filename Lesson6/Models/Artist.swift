//
//  Artist.swift
//  Lesson6
//
//  Created by Matthew on 31.08.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

struct Artist {
    let identifier: Int
    let name: String
    let albums: [Album]
    
    struct Album {
      let name: String
      let songs: [Song]
      let date: Date
    }
    
    struct Song {
      let name: String
      let duration: TimeInterval
    }
}
