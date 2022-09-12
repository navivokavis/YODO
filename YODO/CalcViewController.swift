//
//  CalcViewController.swift
//  YODO
//
//  Created by s x on 9.09.22.
//

import UIKit

class CalcViewController: UIViewController {
    
    //MARK: - variebles
    var resultLabel = UILabel()
    var customView = UIView()
    var buttonOne = UIButton()
    var buttonTwo = UIButton()
    var buttonThree = UIButton()
    var buttonFour = UIButton()
    var buttonFive = UIButton()
    var buttonSix = UIButton()
    var buttonSeven = UIButton()
    var buttonEight = UIButton()
    var buttonNine = UIButton()
    var buttonZero = UIButton()
    var buttonPlus = UIButton()
    var buttonMinus = UIButton()
    var buttonMult = UIButton()
    var buttonDevide = UIButton()
    var buttonEqual = UIButton()
    var buttonAc = UIButton()
    var buttonPlusMinus = UIButton()
    var buttonPercent = UIButton()
    var buttonDot = UIButton()
    var arrayOfButton: [UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        layoutSubviews()
        configureSubviews()
        buildHierarchy()
    }
    
    func layoutSubviews() {
        view.addSubview(resultLabel)
        view.addSubview(customView)
    }
    
    func configureSubviews() {
        view.backgroundColor = .white
        
        resultLabel.textAlignment = .right
        resultLabel.backgroundColor = .white
        resultLabel.text = "0"
        resultLabel.font = .systemFont(ofSize: 45)
        
        addButtonOnView()
        addTagForNumbers()
        addTargets()
        
    }
    
    func buildHierarchy() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        customView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        customView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        customView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
        customView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        customView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor) .isActive = true
    }
    
    
    //MARK: - add button on customView
    
    func addButtonOnView() {
        buttonAc = buttonOnCalc(UIbutton: buttonAc, title: "AC", constTop: customView.topAnchor, constLeft: customView.leftAnchor)
        buttonPlusMinus = buttonOnCalc(UIbutton: buttonPlusMinus, title: "+/-", constTop: customView.topAnchor, constLeft: buttonAc.rightAnchor)
        buttonPercent = buttonOnCalc(UIbutton: buttonPercent, title: "%", constTop: customView.topAnchor, constLeft: buttonPlusMinus.rightAnchor)
        buttonDevide = buttonOnCalc(UIbutton: buttonDevide, title: "/", constTop: customView.topAnchor, constLeft: buttonPercent.rightAnchor)
        buttonSeven = buttonOnCalc(UIbutton: buttonSeven, title: "7", constTop: buttonAc.bottomAnchor, constLeft: customView.leftAnchor)
        buttonEight = buttonOnCalc(UIbutton: buttonEight, title: "8", constTop: buttonPlusMinus.bottomAnchor, constLeft: buttonSeven.rightAnchor)
        buttonNine = buttonOnCalc(UIbutton: buttonNine, title: "9", constTop: buttonPercent.bottomAnchor, constLeft: buttonEight.rightAnchor)
        buttonMult = buttonOnCalc(UIbutton: buttonMult, title: "X", constTop: buttonDevide.bottomAnchor, constLeft: buttonNine.rightAnchor)
        buttonFour = buttonOnCalc(UIbutton: buttonFour, title: "4", constTop: buttonSeven.bottomAnchor, constLeft: customView.leftAnchor)
        buttonFive = buttonOnCalc(UIbutton: buttonFive, title: "5", constTop: buttonEight.bottomAnchor, constLeft: buttonFour.rightAnchor)
        buttonSix = buttonOnCalc(UIbutton: buttonSix, title: "6", constTop: buttonNine.bottomAnchor, constLeft: buttonFive.rightAnchor)
        buttonMinus = buttonOnCalc(UIbutton: buttonMinus, title: "-", constTop: buttonMult.bottomAnchor, constLeft: buttonSix.rightAnchor)
        buttonOne = buttonOnCalc(UIbutton: buttonOne, title: "1", constTop: buttonFour.bottomAnchor, constLeft: customView.leftAnchor)
        buttonTwo = buttonOnCalc(UIbutton: buttonTwo, title: "2", constTop: buttonFive.bottomAnchor, constLeft: buttonOne.rightAnchor)
        buttonThree = buttonOnCalc(UIbutton: buttonThree, title: "3", constTop: buttonSix.bottomAnchor, constLeft: buttonTwo.rightAnchor)
        buttonPlus = buttonOnCalc(UIbutton: buttonPlus, title: "+", constTop: buttonMinus.bottomAnchor, constLeft: buttonThree.rightAnchor)
        addButtonZero()
        buttonDot = buttonOnCalc(UIbutton: buttonDot, title: ".", constTop: buttonThree.bottomAnchor, constLeft: buttonZero.rightAnchor)
        buttonEqual = buttonOnCalc(UIbutton: buttonEqual, title: "=", constTop: buttonPlus.bottomAnchor, constLeft: buttonDot.rightAnchor)
        
    }
    
    //MARK: - add button on Calc
    
    func buttonOnCalc (UIbutton: UIButton, title: String, constTop: NSLayoutYAxisAnchor, constLeft: NSLayoutXAxisAnchor) -> UIButton {
        customView.addSubview(UIbutton)
        UIbutton.setTitle(title, for: .normal)
        UIbutton.titleLabel?.font = .systemFont(ofSize: 30)
        UIbutton.translatesAutoresizingMaskIntoConstraints = false
        UIbutton.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 1 / 4).isActive = true
        UIbutton.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1 / 5).isActive = true
        UIbutton.topAnchor.constraint(equalTo: constTop).isActive = true
        //        UIbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        UIbutton.leftAnchor.constraint(equalTo: constLeft).isActive = true
        UIbutton.backgroundColor = .darkGray
        UIbutton.layer.borderWidth = 3
        
        
        
        return UIbutton
    }
    
    func addButtonZero() {
        customView.addSubview(buttonZero)
        buttonZero.setTitle("0", for: .normal)
        buttonZero.titleLabel?.font = .systemFont(ofSize: 30)
        buttonZero.translatesAutoresizingMaskIntoConstraints = false
        buttonZero.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 1 / 2).isActive = true
        buttonZero.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1 / 5).isActive = true
        buttonZero.bottomAnchor.constraint(equalTo: customView.bottomAnchor).isActive = true
        //        UIbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        buttonZero.leftAnchor.constraint(equalTo: customView.leftAnchor).isActive = true
        buttonZero.backgroundColor = .darkGray
        buttonZero.layer.borderWidth = 3
    }
    
    //MARK: - Tag for Numbers
    func addTagForNumbers() {
        buttonOne.tag = 1
        buttonTwo.tag = 2
        buttonThree.tag = 3
        buttonFour.tag = 4
        buttonFive.tag = 5
        buttonSix.tag = 6
        buttonSeven.tag = 7
        buttonEight.tag = 8
        buttonNine.tag = 9
        buttonZero.tag = 0
    }
    
    //MARK: - add Targets
    func addTargets() {
        buttonOne.addTarget(self, action: #selector(pressNumberOneButton), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(pressNumberTwoButton), for: .touchUpInside)
        buttonThree.addTarget(self, action: #selector(pressNumberThreeButton), for: .touchUpInside)
//        buttonFour.addTarget(self, action: #selector(pressNumberFourButton), for: .touchUpInside)
//        buttonFive.addTarget(self, action: #selector(pressNumberFiveButton), for: .touchUpInside)
//        buttonSix.addTarget(self, action: #selector(pressNumberSixButton), for: .touchUpInside)
//        buttonSeven.addTarget(self, action: #selector(pressNumberSevenButton), for: .touchUpInside)
//        buttonEight.addTarget(self, action: #selector(pressNumberEightButton), for: .touchUpInside)
//        buttonNine.addTarget(self, action: #selector(pressNumberNineButton), for: .touchUpInside)
//        buttonZero.addTarget(self, action: #selector(pressNumberZeroButton), for: .touchUpInside)
    
    }
    
    
    @objc func pressNumberOneButton() {
        resultLabel.text = String(buttonOne.tag)
        var number = UIbutton.currentTitle
        print(number)
    }
    
    @objc func pressNumberTwoButton() {
        resultLabel.text = String(buttonTwo.tag)
    }
    
    @objc func pressNumberThreeButton() {
        resultLabel.text = String(buttonThree.tag)
    }
    
//    @objc func pressNumberTwoButton() {
//        resultLabel.text = String(buttonTwo.tag)
//    }
//
//    @objc func pressNumberTwoButton() {
//        resultLabel.text = String(buttonTwo.tag)
//    }
//
//    @objc func pressNumberTwoButton() {
//        resultLabel.text = String(buttonTwo.tag)
//    }
//
//    @objc func pressNumberTwoButton() {
//        resultLabel.text = String(buttonTwo.tag)
//    }
//
//    @objc func pressNumberTwoButton() {
//        resultLabel.text = String(buttonTwo.tag)
//    }
//
//    @objc func pressNumberTwoButton() {
//        resultLabel.text = String(buttonTwo.tag)
//    }
//
//    @objc func pressNumberTwoButton() {
//        resultLabel.text = String(buttonTwo.tag)
//    }
    
    
    
    
   
    
    
    
}