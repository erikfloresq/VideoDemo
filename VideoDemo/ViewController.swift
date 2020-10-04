//
//  ViewController.swift
//  VideoDemo
//
//  Created by Erik Flores on 10/3/20.
//

import UIKit

class ViewController: UIViewController {
    let videoPlayer = VideoPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(videoPlayer,
                                               selector: #selector(videoPlayer.enterForeground),
                                               name: UIScene.willEnterForegroundNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(videoPlayer,
                                               selector: #selector(videoPlayer.enterBackground),
                                               name: UIScene.didEnterBackgroundNotification,
                                               object: nil)
    }
    
    @IBAction func showVideo(_ sender: UIButton) {
        let playerViewController = videoPlayer.playerViewController
        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
    
    @IBAction func activePip(_ sender: UISwitch) {
        if sender.isOn {
            videoPlayer.playerViewController.allowsPictureInPicturePlayback = true
        } else {
            videoPlayer.playerViewController.allowsPictureInPicturePlayback = false
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

