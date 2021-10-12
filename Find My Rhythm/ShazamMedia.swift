//
//  ShazamMedia.swift
//  Find My Rhythm
//
//  Created by Darshil Agrawal on 20/09/21.
//

import Foundation

struct ShazamMedia: Decodable {
    let title: String?
    let subtitle: String?
    let artistName: String?
    let albumArtURL: URL?
    let genres: [String]
    
    init?(title:String, subtitle:String, albumArtURL: URL, genres: [String]) {
        self.title = title
        self.subtitle = subtitle
        self.artistName = artistName
        self.albumArtURL = albumArtURL
        self.genres = genres
    }
}
