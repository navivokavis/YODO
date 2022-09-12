//
//  QuestionViewController.swift
//  YODO
//
//  Created by s x on 9.09.22.
//

import UIKit

class QuestionViewController: UIViewController {

    
    var answerLabel = UILabel()
    var answerButton = UIButton()
    var arrowWithAnswer: [String] = ["Подумай еще", "Точно да", "Возможно", "Ты знаешь ответ", "Никогда", "Я сейчас занят"]
    
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
        view.addSubview(answerLabel)
        view.addSubview(answerButton)
    }
    
    func configureSubviews() {
        view.backgroundColor = .black
        
        answerLabel.backgroundColor = .white
        answerLabel.textColor = .red
        answerLabel.font = .systemFont(ofSize: 30)
        answerLabel.text = arrowWithAnswer.randomElement()
        answerLabel.textAlignment = .center
        answerLabel.layer.cornerRadius = 100
        answerLabel.layer.masksToBounds = true
        answerLabel.numberOfLines = 0
        
        answerButton.tintColor = .white
        answerButton.titleLabel?.text = "ЖМИ"
        answerButton.setTitle("Cпроси меня и я отвечу", for: .normal)
//        answerButton.titleLabel?.topAnchor.constraint(equalTo: answerButton.topAnchor, constant: 10).isActive = true
//        answerButton.titleLabel = "Жми"
        answerButton.backgroundColor = .red
        answerButton.layer.cornerRadius = 100
        answerButton.layer.masksToBounds = true
        answerButton.titleLabel?.font = .systemFont(ofSize: 30)
        answerButton.titleLabel?.textAlignment = .center
        answerButton.titleLabel?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        answerButton.addTarget(self, action: #selector(changeLabel), for: .touchUpInside)
        
    }
    
    func buildHierarchy() {
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        answerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
//        answerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        answerLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        answerLabel.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        answerButton.translatesAutoresizingMaskIntoConstraints = false
        answerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        answerButton.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 50) .isActive = true
        answerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        answerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50) .isActive = true
        answerButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        answerButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    
    @objc func changeLabel() {
        answerLabel.text = arrowWithAnswer.randomElement()
    }

}
