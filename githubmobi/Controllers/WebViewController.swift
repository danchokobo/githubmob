//
//  WebViewController.swift
//  githubmobi
//
//  Created by Danagul Otel on 23.07.2018.
//  Copyright © 2018 Danagul Otel. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class WebViewController: UIViewController {
    
    var repoUrl: String!
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
        loadWebViewByUrl()
        SVProgressHUD.show(withStatus: "Подождите...")
        // Do any additional setup after loading the view.
    }

    func configureWebView() {
        webView = UIWebView(frame: UIScreen.main.bounds)
        webView.delegate = self
        view.addSubview(webView)
    }
    
    func loadWebViewByUrl() {
        let url = URL(string: repoUrl)!
        webView.loadRequest(URLRequest(url: url))
//        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
//        toolbarItems = [refresh]
//        navigationController?.isToolbarHidden = false
    }
    
}

extension WebViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.showError(withStatus: error.localizedDescription)
        navigationController?.popViewController(animated: true)
    }

}
