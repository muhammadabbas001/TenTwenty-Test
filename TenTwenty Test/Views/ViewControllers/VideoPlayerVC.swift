//
//  VideoPlayerVC.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 20/02/2022.
//

import UIKit
import youtube_ios_player_helper

class VideoPlayerVC: UIViewController, YTPlayerViewDelegate{

    @IBOutlet weak var videoPlayeView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoPlayeView.load(withVideoId: "ta5dr6QxQn0", playerVars: ["autoplay": 0, "controls": 1, "disablekb": ["f"]])
        videoPlayeView.delegate = self
        
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        if state == .ended{
            self.dismiss(animated: true) {}
        }
    }
    
    

}
