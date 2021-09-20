//
//  ContentViewModel.swift
//  Find My Rhythm
//
//  Created by Darshil Agrawal on 20/09/21.
//

import Foundation
import ShazamKit

@available(iOS 15.0, *)
class ContentViewModel: NSObject, ObservableObject {
    @Published var shazamMedia =  ShazamMedia(title: "Title...",
                                              subtitle: "Subtitle...",
                                              artistName: "Artist Name...",
                                              albumArtURL: URL(string: "https://google.com"),
                                              genres: ["Pop"])
    @Published var isRecording = false
    private let audioEngine = AVAudioEngine()
    private let session = SHSession()
    private let signatureGenerator = SHSignatureGenerator()
    
    override init() {
        super.init()
        session.delegate = self
    }
}

@available(iOS 15.0, *)
extension ContentViewModel: SHSessionDelegate {
    func session(_ session: SHSession, didFind match: SHMatch) {
        let mediaItems = match.mediaItems
        
        if let firstItem = mediaItems.first {
            let foundShazamMedia = ShazamMedia(title: firstItem.title,
                                           subtitle: firstItem.subtitle,
                                           artistName: firstItem.artist,
                                           albumArtURL: firstItem.artworkURL,
                                           genres: firstItem.genres)
            DispatchQueue.main.async {
                self.shazamMedia = foundShazamMedia
            }
        }
    }
}
