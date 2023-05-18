//
//  SeekButton.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/17/23.
//

import SwiftUI
import AVFoundation

struct SeekButton: View {
    enum Direction {
        case back
        case forward
    }
    
    private let player: AVPlayer
    private let direction: Direction
    
    static let SEEK_AMOUNT_SECONDS = 10.0
    
    init(player: AVPlayer, direction: Direction) {
        self.player = player
        self.direction = direction
    }

    var body: some View {
        Button(action: {
            let seekAmountSeconds = direction == .back ? -SeekButton.SEEK_AMOUNT_SECONDS : SeekButton.SEEK_AMOUNT_SECONDS
            seekBy(seconds: seekAmountSeconds)
        }) {
            let imagePath = direction == .back ? "icons8-replay-10-100" : "icons8-forward-10-100"
            Image(imagePath)
                .resizable()
                .frame(width: 35, height: 35)
                .padding(6)
        }
        .background(.brown)
        .cornerRadius(50)
    }
    
    private func seekBy(seconds: Double) {
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = currentTime + seconds
        seekToTime(newTime: newTime)
    }
    
    private func seekToTime(newTime: Double) {
        let time = CMTime(seconds: newTime, preferredTimescale: 1)
        player.seek(to: time)
    }
}


