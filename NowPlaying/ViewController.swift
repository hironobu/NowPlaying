//
//  ViewController.swift
//  NowPlaying
//

import Cocoa

class ViewController: NSViewController {
    /// ViewController起動時に呼び出される。
    /// iTunesの状態変更をこのViewControllerでも監視する。
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        DistributedNotificationCenter.default().addObserver(self,
                                                            selector: #selector(onChangeTrack(_:)),
                                                            name: NSNotification.Name(rawValue: "com.apple.iTunes.playerInfo"),
                                                            object: nil)
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    /// iTunesから取得した「再生中の曲アーティスト」表示欄
    @IBOutlet var trackArtist: NSTextField!
    
    /// iTunesから取得した「再生中の曲」表示欄
    @IBOutlet var trackTitle: NSTextField!
    
    // let session: URLSession = URLSession.shared
    
    /// iTunesの状態変更の通知を受け取るイベントハンドラー。
    /// 現在再生中の曲情報を取得し、画面に表示する。
    ///
    @objc func onChangeTrack(_ notification: Notification?) {
        guard let iTunesNotification = notification else { return }
        guard let userInfo = iTunesNotification.userInfo else { return }
        
        print(userInfo)
        
        if let val = userInfo["Artist"] {
            self.trackArtist.stringValue = val as! String;
        }
        if let val = userInfo["Name"] {
            self.trackTitle.stringValue = val as! String;
        }
    }
}

