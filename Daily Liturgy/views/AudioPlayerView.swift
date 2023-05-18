//
//  AudioPlayer.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/17/23.
//

import SwiftUI
import AVFoundation

struct AudioPlayerView: View {
    private let url: URL
    
    @State private var player: AVPlayer?
    
    init(url: URL) {
        self.url = url
    }

    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                if player != nil {
                    SeekButton(player: player!, direction: .back)
                }
                
                Spacer()
                PlayPauseAudioButton(url: url, player: $player)
                Spacer()
                
                if player != nil {
                    SeekButton(player: player!, direction: .forward)
                }
            }
        }.padding()
    }
    
    private func seekForward(seconds: Double) {
        guard let player = player else { return }
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = currentTime + seconds
        
        seekToTime(newTime: newTime)
    }
    
    private func seekBackward(seconds: Double) {
        guard let player = player else { return }
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = currentTime - seconds
        
        seekToTime(newTime: newTime)
    }
    
    private func seekToTime(newTime: Double) {
        guard let player = player else { return }
        let time = CMTime(seconds: newTime, preferredTimescale: 1)
        
        player.seek(to: time) { _ in
            // Completion handler if needed
        }
    }
}

