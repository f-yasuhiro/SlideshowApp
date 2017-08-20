//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 福園康弘 on 2017/08/17.
//  Copyright © 2017年 yasuhiro.fukuzono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var next_button: UIButton!
    @IBOutlet weak var previous_button: UIButton!
    @IBOutlet weak var slide_button: UIButton!
    
    // 配列で画像を取得
    let myimage = [UIImage(named: "sky.jpg") ,UIImage(named: "cloud.jpg"), UIImage(named: "evening.jpg")]
    // 配列のインデックス番号
    var num:Int = 0
    // タイマー用
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 最初の画像を表示
        myImageView.image = myimage[0]
        // imageViewにタップを登録
        myImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 画像をタップした時の動作
    func imageTapped(sender: UITapGestureRecognizer) {
        let storyboard: UIStoryboard = self.storyboard!
        let bigimageView = storyboard.instantiateViewController(withIdentifier: "bigimage") as! BigimageViewController
        // 画像の受け渡し
        bigimageView.bigimage = myImageView.image
        // 画面遷移
        present(bigimageView, animated: true, completion: nil)
        // タイマーを破棄
        if timer != nil {
            self.stop_slide()
        }
    }

    // 『進む』ボタン
    @IBAction func next_image(_ sender: Any) {
        self.show_next_image()
    }
    
    // 『戻る』ボタン
    @IBAction func previous_image(_ sender: Any) {
        // numの値を0なら2、1なら0、2なら1と変更することで画像を変更
        if num == 0 {
            num = 2
        } else if num == 1 {
            num = 0
        } else {
            num = 1
        }
        myImageView.image = myimage[num]
    }
    
    // 『再生/停止』ボタン
    @IBAction func start_stop(_ sender: Any) {
        // スライドショーを再生
        if slide_button.titleLabel?.text == "再生" {
            // 進むボタン、戻るボタンをタップ不可にする
            next_button.isEnabled = false
            previous_button.isEnabled = false
            // ボタンの文字を変更
            slide_button.setTitle("停止", for: .normal)
            // タイマー作成
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.show_next_image), userInfo: nil, repeats: true)
        
        // スライドショーを停止
        } else {
            self.stop_slide()
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    // 次の画像を表示するための関数
    func show_next_image(){
        // numの値を0なら1、1なら2、2なら0と変更することで画像を変更
        if num == 0 {
            num = 1
        } else if num == 1 {
            num = 2
        } else {
            num = 0
        }
        myImageView.image = myimage[num]
    }

    // スライドショーを停止させるための関数
    func stop_slide(){
        // 『進む』、『戻る』ボタンをタップ可にする
        next_button.isEnabled = true
        previous_button.isEnabled = true
        // ボタンの文字を変更
        slide_button.setTitle("再生", for: .normal)
        // タイマーを破棄
        timer.invalidate()
    }

}

