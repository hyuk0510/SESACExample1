//
//  BoardViewController2.swift
//  SESAC_Example1
//
//  Created by 선상혁 on 2023/07/19.
//

import UIKit

class BoardViewController2: UIViewController {
    
    
    @IBOutlet var boardTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var sendButton: UIButton!
    
    @IBOutlet var randomColorButton: UIButton!
    
    @IBOutlet var topView: UIView!
    
    lazy var randomColor = getRandomColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designTopview()
        designSendButton()
        designColorButton()
        
        designResultLabel()
        designBoardTextField()
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        resultLabel.text = boardTextField.text
        boardTextField.text = ""
        
        view.endEditing(true)
        
        topView.isHidden.toggle()
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
    
        view.endEditing(true) // 키보드 내리는 기능
        
        topView.isHidden.toggle()
    }
    
    @IBAction func textViewAction(_ sender: UITextField) {
        
        resultLabel.text = boardTextField.text
        boardTextField.text = ""
        resultLabel.textColor = randomColor
        
        topView.isHidden.toggle()
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        
        randomColor = getRandomColor()
        randomColorButton.tintColor = randomColor
        resultLabel.textColor = randomColor
    }
    
    func designTopview() {
        topView.layer.cornerRadius = 15
    }
    
    func designSendButton() {
        sendButton.setTitle("보내기", for: .normal)
        sendButton.tintColor = .black
        sendButton.layer.cornerRadius = 15
        sendButton.layer.borderWidth = 1
        sendButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func designColorButton() {
        randomColorButton.setTitle("Aa", for: .normal)
        randomColorButton.tintColor = .red
        randomColorButton.layer.cornerRadius = 15
        randomColorButton.layer.borderWidth = 1
        randomColorButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func designResultLabel() {
        resultLabel.textAlignment = .center
        resultLabel.font = .boldSystemFont(ofSize: 60)
        resultLabel.textColor = .red
        resultLabel.text = "Hello Swift"
        resultLabel.numberOfLines = 3
        //resultLabel.numberOfLines = 0 -> 무한대
        
    }
    
    func designBoardTextField() {
        boardTextField.placeholder = "내용을 입력해주세요"
        boardTextField.textColor = .black
        boardTextField.keyboardType = .emailAddress
        boardTextField.borderStyle = .line
    }
    
    func getRandomColor() -> UIColor{
            
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }

}
