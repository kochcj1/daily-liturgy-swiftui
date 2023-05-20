//
//  ContentView.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/14/23.
//

import SwiftUI

struct ContentView: View {
    private let liturgy: Liturgy
    
    @State private var shouldShowAboutPodcastView = false
    @State private var shouldShowAboutAppView = false

    init(liturgy: Liturgy) {
        self.liturgy = liturgy
    }
    
    var body: some View {
        ZStack {
            // A navigation view so that ReadingCard cards can open up a passage of Scripture in a separate view, etc.:
            NavigationView {
                ScrollView {
                    // We want the toolbar menu to be able open up views, but the toolbar menu isn't a descendant
                    // of our navigation view, so we stick these navigation links somewhere and then trigger them
                    // via a menu-initiated state change:
                    getAboutPodcastNavigationLink()
                    getAboutAppNavigationLink()
                    
                    LiturgyView(liturgy: liturgy)
                }
                .background(Rectangle().foregroundColor(Color(.systemGray6)))
                .navigationTitle(liturgy.title!)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarColor(.brown)
                .toolbar {
                    Menu("More") {
                        Button("About The Daily Liturgy Podcast") {
                            shouldShowAboutPodcastView = true
                        }
                        Button("About The Daily Liturgy App") {
                            shouldShowAboutAppView = true
                        }
                    }
                }
            }
            .accentColor(.white)
            .navigationViewStyle(StackNavigationViewStyle())
            
            // Outside the navigation view so that the user can play/pause audio while reading the passage of Scripture:
            AudioPlayerView(url: URL(string: liturgy.audioUrl!)!)
        }.frame(maxWidth: .infinity)
    }
    
    private func getAboutPodcastNavigationLink() -> some View {
        return NavigationLink(isActive: $shouldShowAboutPodcastView) {
            WebView(url: URL(string: "https://dailyliturgy.com/")!)
                .navigationTitle("The Daily Liturgy Podcast")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarColor(.brown)
        } label: {
            EmptyView()
        }
    }
    
    private func getAboutAppNavigationLink() -> some View {
        return NavigationLink(isActive: $shouldShowAboutAppView) {
            VStack(alignment: .leading) {
                Text("All rights to the content used in this app belong to The Daily Liturgy Podcast and Coram Deo Church of Omaha, Nebraska")
                Spacer().frame(height: 30)
                Text("Icons used courtesy of https://icons8.com.").accentColor(.blue)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Rectangle().foregroundColor(Color(.systemGray6)))
            .navigationTitle("About the App")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(.brown)
        } label: {
            EmptyView()
        }
    }
}
