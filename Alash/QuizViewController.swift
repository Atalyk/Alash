//
//  QuizViewController.swift
//  Alash
//
//  Created by Admin on 9/20/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

import UIKit
import SnapKit

class QuizViewController: UIViewController {
    
    var challengeTextView = UITextView()
    var answerButtonOne = UIButton()
    var answerButtonTwo = UIButton()
    var answerButtonThree = UIButton()
    var answerButtonFour = UIButton()
    
    var nextButton = UIButton()
    var repeatButton = UIButton()
    
    var pointLabel = UILabel()
    
    var buttonOffset = 5
    var buttonHeight = 50
    
    let screenBounds = UIScreen.mainScreen().bounds
    
    var questions = ["Әлихан Бөкейхан қай жылы дүниеге келді?", "Қай жылы М.Горькийдің жұбайы Е.П.Пешкованың көмегімен Ахмет Байтұрсынұлы отбасымен мерзімінен бұрын босатылып, Алматыға оралады?", "Байтұрсынұлы қай жылы наурызда Алашорда үкіметі атынан Мәскеуге Кеңес үкіметімен келіссөзге аттанды?", "Міржақып Дулатұлы лақап аты", "Мағжан Жұмабай тұңғыш өлеңдер жинағы", "Ілияс Жансүгіров қай жылы ақталды?", "Бейімбет Жармағамбетұлы Майлин туып-өскен жері"]
    var answers = ["1866", "1934", "1919", "Мир Якуб", "Шолпан", "1958", "Таран ауданы"]
    var options = [["1868", "1856", "1860", "1866"], ["1931", "1925", "1927", "1934"], ["1917", "1919", "1915", "1921"], ["Мир Якуб", "Шәкірт", "Арман", "Қазақ ұлы"], ["Шолпан", "Садақ", "Бірлік", "Сана"], ["1946", "1954", "1958", "1960"], ["Таран ауданы", "Қызылжар ауданы", "Ақтөбе облысы", "Торғай"]]
    
    var index = 0
    var point = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blackColor()
        
        index = 0
        
        self.edgesForExtendedLayout = .None
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        let attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "Helvetica", size: screenBounds.width*0.05)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
        self.automaticallyAdjustsScrollViewInsets = true
        
        title = "Алаштану"
        
        setup()
    }
    
    func setup() {
        
        
        challengeTextView.textColor = UIColor.whiteColor()
        challengeTextView.scrollEnabled = false
        challengeTextView.backgroundColor = UIColor.clearColor()
        challengeTextView.textAlignment = .Center
        challengeTextView.font = UIFont(name: "Helvetica-Light", size: screenBounds.width * 0.05)
        challengeTextView.sizeToFit()
        
        challengeTextView.editable = false
        self.view.addSubview(challengeTextView)
        
        answerButtonOne.backgroundColor = UIColor.whiteColor()
        answerButtonOne.layer.cornerRadius = 10
        answerButtonOne.setTitleColor(UIColor.blackColor(), forState: .Normal)
        answerButtonOne.addTarget(self, action: #selector(answerChallenge(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(answerButtonOne)
        
        answerButtonTwo.backgroundColor = UIColor.whiteColor()
        answerButtonTwo.layer.cornerRadius = 10
        answerButtonTwo.setTitleColor(UIColor.blackColor(), forState: .Normal)
        answerButtonTwo.addTarget(self, action: #selector(answerChallenge(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(answerButtonTwo)
        
        answerButtonThree.backgroundColor = UIColor.whiteColor()
        answerButtonThree.layer.cornerRadius = 10
        answerButtonThree.setTitleColor(UIColor.blackColor(), forState: .Normal)
        answerButtonThree.addTarget(self, action: #selector(answerChallenge(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(answerButtonThree)
        
        answerButtonFour.backgroundColor = UIColor.whiteColor()
        answerButtonFour.layer.cornerRadius = 10
        answerButtonFour.setTitleColor(UIColor.blackColor(), forState: .Normal)
        answerButtonFour.addTarget(self, action: #selector(answerChallenge(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(answerButtonFour)
        
        nextButton.backgroundColor = UIColor.whiteColor()
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        nextButton.setTitle("Келесі сұрақ", forState: .Normal)
        nextButton.addTarget(self, action: #selector(nextButtonPressed), forControlEvents: .TouchUpInside)
        self.view.addSubview(nextButton)
        
        repeatButton.backgroundColor = UIColor.clearColor()
        repeatButton.layer.cornerRadius = 10
        repeatButton.layer.borderWidth = 1
        repeatButton.layer.borderColor = UIColor.whiteColor().CGColor
        repeatButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        repeatButton.setTitle("Қайтадан бастау", forState: .Normal)
        repeatButton.addTarget(self, action: #selector(repeatButtonPressed), forControlEvents: .TouchUpInside)
        self.view.addSubview(repeatButton)
        
        self.view.addSubview(pointLabel)
        
        updateViewConstraints()
        
        loadChallenge()
    }
    
    func answerChallenge(button: UIButton) {
        if button.titleLabel?.text == answers[index] {
            button.layer.backgroundColor = UIColor.greenColor().CGColor
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            point += 1
        } else {
            button.layer.backgroundColor = UIColor.redColor().CGColor
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        toggleButtons(false)
        index += 1
    }
    
    func nextButtonPressed() {
    
        if index < 7 {
            loadChallenge()
        } else {
            let percentage = point*100/7
            challengeTextView.text = "Сіздің Алаштануыңыз \(percentage)%"
        }
    }
    
    func repeatButtonPressed() {
        viewDidLoad()
    }
    
    func toggleButtons(toggle: Bool) {
        answerButtonOne.userInteractionEnabled = toggle
        answerButtonTwo.userInteractionEnabled = toggle
        answerButtonThree.userInteractionEnabled = toggle
        answerButtonFour.userInteractionEnabled = toggle
    }
    
    func loadChallenge() {
    
        challengeTextView.text = questions[index]
        answerButtonOne.setTitle(options[index][0], forState: .Normal)
        answerButtonTwo.setTitle(options[index][1], forState: .Normal)
        answerButtonThree.setTitle(options[index][2], forState: .Normal)
        answerButtonFour.setTitle(options[index][3], forState: .Normal)
        
        answerButtonOne.layer.backgroundColor = UIColor.whiteColor().CGColor
        answerButtonTwo.layer.backgroundColor = UIColor.whiteColor().CGColor
        answerButtonThree.layer.backgroundColor = UIColor.whiteColor().CGColor
        answerButtonFour.layer.backgroundColor = UIColor.whiteColor().CGColor
        
        answerButtonOne.setTitleColor(UIColor.blackColor(), forState: .Normal)
        answerButtonTwo.setTitleColor(UIColor.blackColor(), forState: .Normal)
        answerButtonThree.setTitleColor(UIColor.blackColor(), forState: .Normal)
        answerButtonFour.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        toggleButtons(true)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        challengeTextView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(screenBounds.height * 0.07)
            make.width.equalTo(screenBounds.width * 0.8)
            make.centerX.equalTo(self.view.snp_centerX)
        }
        
        answerButtonOne.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(screenBounds.width * 0.6)
            make.top.equalTo(self.challengeTextView.snp_bottom).offset(buttonOffset)
            make.centerX.equalTo(self.view.snp_centerX)
        }
        
        answerButtonTwo.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(screenBounds.width * 0.6)
            make.top.equalTo(self.answerButtonOne.snp_bottom).offset(buttonOffset)
            make.centerX.equalTo(self.view.snp_centerX)
        }
        
        answerButtonThree.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(screenBounds.width * 0.6)
            make.top.equalTo(self.answerButtonTwo.snp_bottom).offset(buttonOffset)
            make.centerX.equalTo(self.view.snp_centerX)
        }
        
        answerButtonFour.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(screenBounds.width * 0.6)
            make.top.equalTo(self.answerButtonThree.snp_bottom).offset(buttonOffset)
            make.centerX.equalTo(self.view.snp_centerX)
        }
        
        nextButton.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(screenBounds.width * 0.6)
            make.top.equalTo(self.answerButtonFour.snp_bottom).offset(buttonOffset)
            make.centerX.equalTo(self.view.snp_centerX)
        }
        
        repeatButton.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(screenBounds.width * 0.6)
            make.top.equalTo(self.nextButton.snp_bottom).offset(buttonOffset)
            make.centerX.equalTo(self.view.snp_centerX)
        }


    }

}
