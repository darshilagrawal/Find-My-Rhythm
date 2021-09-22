//
//  ContentViewModel.swift
//  Find My Rhythm
//
//  Created by Darshil Agrawal on 22/09/21.
//

import Foundation
import ShazamKit
import AVKit
import SwiftUI

struct ShazamMedia: Decodable {
    let title: String?
    let subtitle: String?
    let artistName: String?
    let albumArtURL: URL?
    let genres: [String]
}


