//
//  ViewController.swift
//  OnboardApp
//
//  Created by Raphael on 2020/10/24.
//  Copyright © 2020 Raphael. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var onbordStringArray = ["はじめる","こんにちは","アイウエオ","かきくけこ","さようなら"]
    
    @IBOutlet weak var scrolView: UIScrollView!
    
    var animationArray = ["onboard1","onboard2","onboard3","onboard4","onboard5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スクロールビューのページ表示
        scrolView.isPagingEnabled = true
        
        setUpScroll()
        
        //アニメーション(Lottie)
        for i in 0...4{
            let animationView = AnimationView()
            let animation = Animation.named(animationArray[i])
            animationView.frame = CGRect(x: CGFloat(i) * self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            //ループ再生
            animationView.loopMode = .loop
            // アニメーションを開始
            animationView.play()
            //適用する
            scrolView.addSubview(animationView)
        }
    }


    func setUpScroll(){
        
        scrolView.contentSize = CGSize(width: view.frame.size.width * 5, height: view.frame.size.height)
        
        for i in 0...4{
            let onbordLabel = UILabel(frame: CGRect(x: CGFloat(i) * self.view.frame.size.width, y: self.view.frame.size.height/3, width: scrolView.frame.size.width, height: scrolView.frame.size.height))
            //フォント
            onbordLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            //中央寄せ
            onbordLabel.textAlignment = .center
            //配列を反映
            onbordLabel.text = onbordStringArray[i]
            //適用する
            scrolView.addSubview(onbordLabel)
        }
    }
}

