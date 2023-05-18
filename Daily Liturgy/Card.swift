//
//  Card.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/14/23.
//

import SwiftUI

struct Card: View {
    let title: String
    let description: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.brown)
                    .clipShape(Circle())
                Text(title)
                    .fontWeight(.bold)
            }
            Text(description)
        }
        .padding()
        .background(Rectangle()
            .foregroundColor(.white)
            .cornerRadius(5)
            .shadow(radius: 5))
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(
            title: "The Lord’s Prayer",
            description: "Our Father, who art in heaven, hallowed be thy Name. Thy kingdom come. Thy will be done, on earth as it is in heaven. Give us this day our daily bread. And forgive us our debts, as we forgive our debtors. And lead us not into temptation, but deliver us from evil. For thine is the kingdom and the power, and the glory, forever. Amen.",
            icon: "icons8-pray-64"
        )
    }
}
