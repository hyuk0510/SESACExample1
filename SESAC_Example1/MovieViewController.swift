//
//  MovieViewController.swift
//  SESACExample1
//
//  Created by 선상혁 on 2023/07/19.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    
    @IBOutlet var movieFoster: UIImageView!
    
    @IBOutlet var randomPlayButton: UIButton!
    @IBOutlet var informationLabel: UILabel!
    //Thread 1: this class is not key value coding-compliant for the key infoLabel.
    
    
    //사용자에게 화면이 보이기 직전에 실행되는 부분
    //모서리 둥글기, 그림자 등 스토리보드에서 설정할 수 없는 UI를 설정할 때 주로 사용
    //뷰컨트롤러 생명주기
    
    let random = ["왕의남자", "아바타", "부산행", "도둑들"]
    let normal = UIImage(named: "play_normal")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setImageView(firstImageView, borderColor: UIColor.green.cgColor)
        setImageView(secondImageView, borderColor: UIColor.gray.cgColor)
        setImageView(thirdImageView, borderColor: UIColor.red.cgColor)
        
        setPlayButton()
    }
    
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        
        //Swift5부터 Raw Strings 사용
        
        //아이패드 actionSheet 막 쓰면 꺼짐
        
        //1.
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        //2.
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        let save = UIAlertAction(title: "저장", style: .default)
        let button = UIAlertAction(title: "가나다라마바사", style: .destructive)
        
        //3.
        alert.addAction(ok)
        alert.addAction(save)
        alert.addAction(cancel)
        alert.addAction(button)
        
        //4.
        present(alert, animated: true)
    }
    
    
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        
//        let num = Int.random(in: 1...5)
//        firstImageView.image = UIImage(named: "\(num)")
        
        showRandomMovie(firstImageView)
        showRandomMovie(secondImageView)
        showRandomMovie(thirdImageView)
        showRandomMovie(movieFoster)
        
    }
    
    @IBAction func secondImageViewChange(_ sender: UIButton) {
        
        let randomValue = random.randomElement()!

        secondImageView.image = UIImage(named: randomValue)
        
    }
    
    func showRandomMovie(_ movie: UIImageView) {
        let num = [1, 2, 3, 4, 5]
        let randomNum = num.randomElement()!
        
        movie.image = UIImage(named: "\(randomNum)")
    }
    
    //outletName: 외부 매개변수(Argument Label), name: 내부 매개변수(Parameter name)
    //매개변수: Parameter - 전달인자를 받을 변수
    //전달인자: Argument - 함수를 호출할 때 전달하는 값 (시시각각 변동)
    func setImageView(_ name: UIImageView, borderColor: CGColor) {
        name.layer.cornerRadius = 30
        name.layer.borderColor = borderColor
        name.layer.borderWidth = 5
        
        name.backgroundColor = .blue
        name.contentMode = .scaleAspectFill
    }

    func setPlayButton() {
        randomPlayButton.setTitle("재생", for: .normal)
        randomPlayButton.setTitle("눌러주세요", for: .highlighted)
        randomPlayButton.setTitleColor(.white, for: .normal)
        randomPlayButton.setTitleColor(.red, for: .highlighted)
        
        randomPlayButton.setImage(normal, for: .highlighted)
        randomPlayButton.setImage(UIImage(named: "play_highlighted"), for: .highlighted)
        
        randomPlayButton.layer.cornerRadius = 10
        randomPlayButton.layer.borderColor = UIColor.red.cgColor
        randomPlayButton.layer.borderWidth = 4
    }

}
