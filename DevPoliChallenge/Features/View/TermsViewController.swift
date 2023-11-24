//
//  WebViewController.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit
import WebKit

class TermsViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let termsViewModel = TermsViewModel()
        termsViewModel.delegate = self
        termsViewModel.onLoad()
        title = "Termos e condiçōes"
    }
    
}

extension TermsViewController: TermsDelegate {
    func openTerms(url: URL) {
        
        self.webView.load(URLRequest(url: url))
        
    }
}
