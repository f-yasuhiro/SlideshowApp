//
//  BigimageViewController.swift
//  SlideshowApp
//
//  Created by 福園康弘 on 2017/08/17.
//  Copyright © 2017年 yasuhiro.fukuzono. All rights reserved.
//

import UIKit

class BigimageViewController: UIViewController {
    
    @IBOutlet weak var BigImageView: UIImageView!
    // スライドショー画面から受け渡される画像
    var bigimage :UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        BigImageView.image = bigimage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
