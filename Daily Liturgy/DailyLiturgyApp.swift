//
//  DailyLiturgyApp.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/14/23.
//

import SwiftUI
import AVFoundation

@main
struct DailyLiturgyApp: App {
    
    static let SHOULD_SHOW_AUDIO_PLAYER_SETTING_NAME = "shouldShowAudioPlayer"
    
    var body: some Scene {
        WindowGroup {
            SplashView().onAppear {
                // So that audio will play even when the device is in silent mode:
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [])
                    try AVAudioSession.sharedInstance().setActive(true)
                }
                catch {
                    print(error)
                }
            }
            .preferredColorScheme(.light) // opt out of dark mode
            .onAppear {
                UserDefaults.standard.register(defaults: [DailyLiturgyApp.SHOULD_SHOW_AUDIO_PLAYER_SETTING_NAME : true])
            }
        }
    }
}
