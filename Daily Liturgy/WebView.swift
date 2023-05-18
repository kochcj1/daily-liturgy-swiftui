//
//  WebView.swift
//  Daily Liturgy
//
//  Created by Caleb Koch on 5/14/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}
}

struct WebView_Previews: View {
    var body: some View {
        WebView(url: URL(string: "https://www.example.com")!)
    }
}

