//
//  Liturgy.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/14/23.
//

import SwiftSoup
import Foundation

struct Liturgy {
    
    var title: String?
    var audioUrl: String?
    var openingPrayer: String?
    var confessionOfSinAndPrayerForGrace: String?
    var oldTestamentReading: String?
    let theLordsPrayer: String = "Our Father, who art in heaven, hallowed be thy Name. Thy kingdom come. Thy will be done, on earth as it is in heaven. Give us this day our daily bread. And forgive us our debts, as we forgive our debtors. And lead us not into temptation, but deliver us from evil. For thine is the kingdom and the power, and the glory, forever. Amen."
    var newTestamentReading: String?
    var prayerOfAdoration: String?
    var psalmReading: String?
    var prayerOfConsecration: String?
    let benediction: String = "And now may the grace of the Lord Jesus Christ, and the love of God, and the fellowship of the Holy Spirit, be with us now and always, until the day of Christ's return."
    
    init() {}
    
    init(htmlDocument: SwiftSoup.Document) {
        do {
            title = try htmlDocument.select("h1.blog-title").first()?.text(trimAndNormaliseWhitespace: true)
            audioUrl = try htmlDocument.select("div.sqs-audio-embed").first()?.attr("data-url").replacingOccurrences(of: "http:", with: "https:")
            openingPrayer = try htmlDocument.select("h3:contains(Opening Prayer)").first()?.nextElementSibling()?.children().select("em").first()?.text(trimAndNormaliseWhitespace: true)
            confessionOfSinAndPrayerForGrace = try htmlDocument.select("h3:contains(Confession of Sin & Prayer for Grace)").first()?.nextElementSibling()?.children().select("em").first()?.text(trimAndNormaliseWhitespace: true)
            oldTestamentReading = try htmlDocument.select("h3:contains(Old Testament Reading)").first()?.text(trimAndNormaliseWhitespace: true).split(separator: ":").suffix(from: 1).joined(separator: ":").trimmingCharacters(in: NSCharacterSet.whitespaces)
            newTestamentReading = try htmlDocument.select("h3:contains(New Testament Reading)").first()?.text(trimAndNormaliseWhitespace: true).split(separator: ":").suffix(from: 1).joined(separator: ":").trimmingCharacters(in: NSCharacterSet.whitespaces)
            prayerOfAdoration = try htmlDocument.select("h3:contains(Prayer of Adoration)").first()?.nextElementSibling()?.children().select("em").first()?.text(trimAndNormaliseWhitespace: true)
            psalmReading = try htmlDocument.select("h3:contains(Psalm Reading)").first()?.text(trimAndNormaliseWhitespace: true).split(separator: ":").suffix(from: 1).joined(separator: ":").trimmingCharacters(in: NSCharacterSet.whitespaces)
            prayerOfConsecration = try htmlDocument.select("h3:contains(Prayer of Consecration)").first()?.nextElementSibling()?.children().select("em").first()?.text(trimAndNormaliseWhitespace: true)
        } catch {}
    }
    
    
}
