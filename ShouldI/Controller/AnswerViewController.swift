//
//  AnswerViewController.swift
//  ShouldI
//
//  Created by Luis Gonzalez on 12/13/24.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var questionLabel = UILabel()
    var answerLabel = UILabel()
    var rememberButton = UIButton()
    var forgetButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configure()
    }
    
    func configure() {
        questionLabel.numberOfLines = 0
        questionLabel.font = .boldSystemFont(ofSize: 34)
        questionLabel.textColor = .label
        questionLabel.textAlignment = .center
        
        answerLabel.numberOfLines = 0
        answerLabel.font = .systemFont(ofSize: 28)
        answerLabel.textColor = .label
        answerLabel.textAlignment = .center
        
        rememberButton.setTitle("Remember", for: .normal)
        rememberButton.setTitleColor(.systemBackground, for: .normal)
        rememberButton.backgroundColor = .systemGreen
        rememberButton.layer.cornerRadius = 10
        rememberButton.addTarget(self, action: #selector(rememberAnswer), for: .touchUpInside)
        
        forgetButton.setTitle("Forget", for: .normal)
        forgetButton.setTitleColor(.systemBackground, for: .normal)
        forgetButton.backgroundColor = .systemRed
        forgetButton.layer.cornerRadius = 10
        forgetButton.addTarget(self, action: #selector(backToQuestions), for: .touchUpInside)
        
        view.addSubview(questionLabel)
        view.addSubview(answerLabel)
        view.addSubview(rememberButton)
        view.addSubview(forgetButton)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        rememberButton.translatesAutoresizingMaskIntoConstraints = false
        forgetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 150),
            answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            answerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            rememberButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            rememberButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -25),
            rememberButton.widthAnchor.constraint(equalToConstant: 150),
            rememberButton.heightAnchor.constraint(equalToConstant: 50),
            
            forgetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            forgetButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25),
            forgetButton.widthAnchor.constraint(equalToConstant: 150),
            forgetButton.heightAnchor.constraint(equalToConstant: 50),
            
            ])
    }
    
    @objc func rememberAnswer() {
        questionsSaved.append(questions)
        answersSaved.append(answers)
        
        let alert = UIAlertController(title: "Remembered", message: "Your answer has been saved to your history", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [self]
                UIAlertAction in
            backToQuestions()
            }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func backToQuestions() {
        navigationController?.popToRootViewController(animated: true)
    }
}
