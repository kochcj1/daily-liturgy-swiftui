//
//  ReadingCard.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/14/23.
//

import WebKit
import SwiftUI

struct ReadingCard: View {
    let title: String
    let passage: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("icons8-holy-bible-60")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.brown)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                    Text(passage)
                        .foregroundColor(.gray)
                }
            }
            NavigationLink {
                let formattedPassage = passage.replacingOccurrences(of: " ", with: "+")
                WebView(url: URL(string: "https://www.esv.org/\(formattedPassage)")!)
                    .navigationTitle(passage)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarColor(.brown)
            } label: {
                HStack {
                    Spacer()
                    Text("Read").foregroundColor(.brown)
                    Spacer()
                }
            }
        }
        .padding()
        .background(Rectangle()
            .foregroundColor(.white)
            .cornerRadius(5)
            .shadow(radius: 5))
    }
}

struct ReadingCard_Previews: PreviewProvider {
    static var previews: some View {
        ReadingCard(title: "Old Testament Reading", passage: "Hosea 11")
    }
}
