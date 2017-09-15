//
//  ViewController.swift
//  wkwebviewtest
//
//  Created by Dustin Williams on 9/15/17.
//  Copyright © 2017 FanReact. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var WKWebViewContainer: UIView!
    @IBOutlet weak var AVContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
    }
    
    override func viewDidAppear( _ animated: Bool) {
        let videoURL = URL(string: "https://qaupwardsa.blob.core.windows.net/app0/videos/274b38fc-10c0-4300-8fdb-92acaf336d7a.mp4")
//        let videoURL = URL(string: "https://www.youtube.com/watch?v=gD24sRU7Swk")
        SetUpWKWebView(url: videoURL!)
        SetUpAV(url: videoURL!);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SetUpWKWebView(url: URL)
    {
        let config = WKWebViewConfiguration()
//        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = .all
        config.mediaPlaybackRequiresUserAction = true
//        config.allowsPictureInPictureMediaPlayback = true
//        let prefs = WKPreferences()
//        prefs.javaScriptEnabled = false
//        prefs.minimumFontSize = 8
//        
//        config.preferences = prefs
    
        
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: WKWebViewContainer.frame.width, height: WKWebViewContainer.frame.height), configuration: config)
//        webView.allowsLinkPreview = true
//        webView.clipsToBounds = true
//        webView.scrollView.isScrollEnabled = false
//        webView.contentMode = .scaleAspectFit
//        webView.translatesAutoresizingMaskIntoConstraints = false
        WKWebViewContainer.addSubview(webView)
        
        let request = URLRequest(url: url)
        webView.load(request)
    
       
    }
    
    func SetUpAV(url: URL)
    {
        
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        AVContainer.layer.addSublayer(playerLayer)
//        player.play()
    }
}

