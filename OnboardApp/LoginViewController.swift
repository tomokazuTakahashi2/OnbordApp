//
//  LoginViewController.swift
//  OnboardApp
//
//  Created by Raphael on 2020/10/24.
//  Copyright © 2020 Raphael. All rights reserved.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController {
    
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        //AVFoundation
        let path = Bundle.main.path(forResource: "start", ofType: "mov") //動画ファイルの在処
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        //再生
        player.play()
        
        
        //動画が再生される画面
        let playerLayer = AVPlayerLayer(player: player)
        //位置
        playerLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        
        //無限ループ
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main){
            (notification)in
            //終わったらまた０を探して再生
            self.player.seek(to: .zero)
            self.player.play()
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
