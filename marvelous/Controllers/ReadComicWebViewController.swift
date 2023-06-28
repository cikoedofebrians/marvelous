//
//  ReadComicWebViewController.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 28/06/23.
//

import UIKit
import WebKit
class ReadComicWebViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var url: URL!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    

}
