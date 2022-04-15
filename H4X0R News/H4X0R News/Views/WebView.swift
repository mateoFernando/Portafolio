//
//  WebView.swift
//  H4X0R News
//
//  Created by Fernando Daniel on 15/04/22.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    typealias UIViewType = WKWebView

    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    /*
     Cambiar el UIViewType
     */
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }

}
