//
//  PlayPauseAudioButton.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/17/23.
//

import SwiftUI
import AVFoundation

struct PlayPauseAudioButton: View {
    var url: URL
    @Binding var player: AVPlayer?
    
    @State private var isPlaying = false
    @State private var currentPlaybackTime: CMTime? = nil
    @State private var playbackObserver: Any?
    
    var body: some View {
        Button(action: {
            if player == nil {
                let playerItem = AVPlayerItem(url: url)
                player = AVPlayer(playerItem: playerItem)
            }
            
            if isPlaying {
                isPlaying = false
                player!.pause()
                player!.removeTimeObserver(playbackObserver!)
            } else {
                isPlaying = true
                player!.play()
                
                // Observe the player's playback so that we can update the playback time for the user:
                playbackObserver = player!.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 100), queue: DispatchQueue.main) { [self] time in
                    self.currentPlaybackTime = time
                    
                    // If we've reached the end of the audio, then reset the view:
                    if time.seconds >= player!.currentItem!.duration.seconds {
                        player!.removeTimeObserver(playbackObserver!)
                        currentPlaybackTime = nil
                        isPlaying = false
                        player = nil
                    }
                }
            }
        }) {
            HStack {
                Image(isPlaying ? "icons8-pause-90" : "icons8-play-90")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: currentPlaybackTime == nil ? 6 : 0))
                    .foregroundColor(.white)
                
                let currentTime = timeToMinutesAndSeconds(currentPlaybackTime)
                let totalTime = timeToMinutesAndSeconds(player?.currentItem?.duration)
                if currentTime != nil && totalTime != nil {
                    let displayTime = currentTime! + " / " + totalTime!
                    Text(displayTime)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                        .monospacedDigit()
                    
                }
            }
        }
        .background(.brown)
        .cornerRadius(25)
    }
    
    private func timeToMinutesAndSeconds(_ time: CMTime?) -> String? {
        if time == nil {
            return nil
        }
        
        var minutes = CMTimeGetSeconds(time!) / 60
        if minutes.isNaN {
            minutes = 0
        }
        let remainder = minutes.truncatingRemainder(dividingBy: 1)
        let seconds = Int(remainder * 60)
        minutes = floor(minutes)
        return String(format: "%.0f:%02d", minutes, seconds)
    }
    
}
