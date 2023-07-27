//
//  NetflixViewController.swift
//  SESAC_Example1
//
//  Created by 선상혁 on 2023/07/19.
//

import UIKit

enum TextFieldType: Int {
    case id = 1
    case password
    case nickname
    case address
    case code
}

class NetflixViewController: UIViewController {

    let holder = ["이메일 주소 또는 전화번호", "비밀번호", "닉네임", "위치", "추천 코드 입력"]
    
    var count = 0
    
    @IBOutlet var textField: [UITextField]!
    
    @IBOutlet var joinButton: UIButton!
    
    @IBOutlet var extraInfoSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let testString = UserDefaults.standard.string(forKey: "testString")//기본값 nil
//        let testInt = UserDefaults.standard.integer(forKey: "testInt") //기본값 0
//        let testBool = UserDefaults.standard.bool(forKey: "testBool")
        //기본값 false
//
//        print(testString, testInt, testBool)
        
        for tf in textField {
            tf.placeholder = holder[count]
            setTextField(tf)
            
            count += 1
            tf.tag = count
            
            guard let text = UserDefaults.standard.string(forKey: tf.placeholder!) else {
                return
            }
            tf.text = text
            print(text)
            
        }
        
        setButton(joinButton)
        setSwitch(extraInfoSwitch)
    }
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        
        guard let text = sender.text, let value = TextFieldType(rawValue: sender.tag) else {
            print("잘못된 입력입니다.")
            return
        }
        
        isValidInput(sender)

        
//        if sender.tag == TextFieldType.id
//            .rawValue {
//            print("아이디는 \(text)입니다.")
//        } else if sender.tag == TextFieldType.password.rawValue {
//            print("비밀번호는 \(text)입니다.")
//        } else {
//            print("닉네임은 \(text)입니다")
//        }
        
        
//        switch sender.tag {
//        case TextFieldType.id.rawValue: print("아이디는 \(text)입니다.")
//        case TextFieldType.password.rawValue:
//            print("비밀번호는 \(text)입니다.")
//        case TextFieldType.nickname.rawValue:
//            print("닉네임은 \(text)입니다")
//        default:
//            print("잘못된 케이스입니다.")
//        }
        
//      guard let value = TextFieldType(rawValue: sender.tag) else {
//            print("오류입니다.")
//            return
//        }
        
        switch value {
        case .id: print("아이디는 \(text)입니다.")
        case .password: print("비밀번호는 \(text)입니다.")
        case .nickname: print("닉네임은 \(text)입니다.")
        case .address: print("주소는 \(text)입니다.")
        case .code: print("추천 코드는 \(text)입니다.")
        }
        
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        print("저장 버튼 클릭")
        
//        for tf in textField {
//            UserDefaults.standard.set(tf.text!, forKey: tf.placeholder!)
//        }
        
        //저장 버튼 클릭 횟수 저장 기능
        //1. 저장된 횟수 가지고 오기
        let value = UserDefaults.standard.integer(forKey: "count")
        //2. 저장된 횟수에 1을 더하기
        let result = value + 1
        //3. 2번에서 나온 결과를 다시 저장해주기
        UserDefaults.standard.set(result, forKey: "count")
        //4. 확인
        print("\(result)번 눌렀습니다.")
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
    
    func isValidInput(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        
        if text.count < 4 {
            let alert = UIAlertController(title: "4글자 이상 입력해주세요!", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
    }
}
