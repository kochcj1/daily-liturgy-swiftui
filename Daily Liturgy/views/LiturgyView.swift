//
//  LiturgyView.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/17/23.
//

import SwiftUI

struct LiturgyView: View {
    private let liturgy: Liturgy

    init(liturgy: Liturgy) {
        self.liturgy = liturgy
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Card(title: "Opening Prayer", description: liturgy.openingPrayer!, icon: "icons8-pray-64")
            Card(title: "Confession of Sin & Prayer for Grace", description: liturgy.confessionOfSinAndPrayerForGrace!, icon: "icons8-pray-64")
            ReadingCard(title: "Old Testament Reading", passage: liturgy.oldTestamentReading!)
            Card(title: "The Lord’s Prayer", description: liturgy.theLordsPrayer, icon: "icons8-pray-64")
            ReadingCard(title: "New Testament Reading", passage: liturgy.newTestamentReading!)
            Card(title: "Prayer of Adoration", description: liturgy.prayerOfAdoration!, icon: "icons8-pray-64")
            ReadingCard(title: "Psalm Reading", passage: liturgy.psalmReading!)
            Card(title: "Prayer of Consecration", description: liturgy.prayerOfConsecration!, icon: "icons8-pray-64")
            Card(title: "Benediction", description: liturgy.benediction, icon: "icons8-gift-96")
            Spacer(minLength: 25)
        }.padding().padding()
    }
}

