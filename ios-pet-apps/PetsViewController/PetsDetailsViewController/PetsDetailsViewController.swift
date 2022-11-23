//
//  PetsDetailsViewController.swift
//  ios-pet-apps
//
//  Created by Md Mozammil on 21/11/22.
//

import UIKit
import WebKit

class PetsDetailsViewController: UIViewController {

    @IBOutlet var petsDetailView: WKWebView?
    var url: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width,
                                              height: self.petsDetailView?.frame.size.height ??
                                              self.view.frame.size.height))
        self.view.addSubview(webView)
        let url = URL(string: self.url)
        if let url = url {
            webView.load(URLRequest(url: url))
        }
        self.navigationController?.navigationBar.isHidden = false
    }
}
