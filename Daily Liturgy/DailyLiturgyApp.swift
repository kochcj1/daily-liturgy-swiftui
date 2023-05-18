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
    var body: some Scene {
        WindowGroup {
            SplashView().onAppear {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [])
                    try AVAudioSession.sharedInstance().setActive(true)
                }
                catch {
                    print(error)
                }
            }
        }
    }
}
