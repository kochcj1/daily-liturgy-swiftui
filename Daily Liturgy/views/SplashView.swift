//
//  SplashView.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/17/23.
//
// Based on https://medium.com/@liyicky/how-to-make-a-splash-screen-in-swift-ui-83b02984a6ab
//

import SwiftUI
import SwiftSoup

struct SplashView: View {
    
    static let DAILY_LITURGY_URL = URL(string: "https://dailyliturgy.com/read")!
    
    @State private var liturgy: Liturgy? = nil
    
    var body: some View {
        ZStack {
            if liturgy != nil {
                ContentView(liturgy: liturgy!)
            } else {
                Image("Daily_Liturgy_Logo")
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear {
            Task {
                liturgy = await getLiturgyForToday()!
            }
        }
    }
    
    private func getLiturgyForToday() async -> Liturgy? {
        var liturgy: Liturgy? = nil
        
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: SplashView.DAILY_LITURGY_URL))
            if let html = String(data: data, encoding: .utf8) {
                do {
                    let doc: SwiftSoup.Document = try SwiftSoup.parse(html)
                    liturgy = Liturgy(htmlDocument: doc)
                } catch {}
            }
        } catch {}
        
        return liturgy
    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
