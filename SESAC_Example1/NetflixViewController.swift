//
//  NetflixViewController.swift
//  SESAC_Example1
//
//  Created by 선상혁 on 2023/07/19.
//

import UIKit

class NetflixViewController: UIViewController {

    let holder = ["이메일 주소 또는 전화번호", "비밀번호", "닉네임", "위치", "추천 코드 입력"]
    
    var count = 0
    
    @IBOutlet var textField: [UITextField]!
    
    @IBOutlet var joinButton: UIButton!
    
    @IBOutlet var extraInfoSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for tf in textField {
            tf.placeholder = holder[count]
            setTextField(tf)
            
            count += 1
        }
        
        setButton(joinButton)
        setSwitch(extraInfoSwitch)
    }
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        view.endEditing(true)
    }
    

    func setTextField(_ tf: UITextField) {
        tf.textColor = .white
        tf.keyboardType = .emailAddress
        tf.borderStyle = .line
        tf.textAlignment = .center
        tf.backgroundColor = .gray
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 20
    }
    
    func setButton(_ button: UIButton) {
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
    }
    
    func setSwitch(_ toggle: UISwitch) {
        toggle.onTintColor = .red
        toggle.thumbTintColor = .white
        toggle.setOn(true, animated: true)
    }
}
