//
//  TestViewController.swift
//  SESAC_Example1
//
//  Created by 선상혁 on 2023/07/20.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var newButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        newButton.backgroundColor = .blue
        
        var config = UIButton.Configuration.filled() //apple system button
        config.title = "SeSAC 영등포캠퍼스"
        config.subtitle = "로그인 없이 둘러보기"
        config.image = UIImage(systemName: "star")
        
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .yellow
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.titleAlignment = .trailing

        
        config.cornerStyle = .capsule
        newButton.configuration = config
    }
    
    //Any
    
    @IBAction func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    
    
}


// Not Running 앱이 시작되기 전 상태

//-Foreground
// Active 앱이 화면에서 실행중인 상태
// Inactive 앱이 화면에서 실행 중이나 어떤 신호도 받지 않는 상태

//Background 앱이 화면에 보이지 않지만 코드를 실행하고 있는 상태

//Suspend 앱이 곧 종료될 상태
