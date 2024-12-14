//
//  ViewController.swift
//  ShouldI
//
//  Created by Luis Gonzalez on 12/13/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var count = 2
    var solutionArray: [String] = []
    
    let questionField: UITextField = {
        let field = UITextField()
        field.placeholder = "What is your question?"
        field.borderStyle = .roundedRect
        field.font = .systemFont(ofSize: 24)
        field.textAlignment = .center
        field.backgroundColor = .systemBackground
        field.layer.cornerRadius = 16
        
        return field
    }()
    
    let option1Field: UITextField = {
        let field = UITextField()
        field.placeholder = "Option 1"
        field.borderStyle = .roundedRect
        field.font = .systemFont(ofSize: 24)
        field.textAlignment = .center
        field.backgroundColor = .systemBackground
        field.layer.cornerRadius = 16
        
        return field
    }()
    
    let option2Field: UITextField = {
        let field = UITextField()
        field.placeholder = "Option 2"
        field.borderStyle = .roundedRect
        field.font = .systemFont(ofSize: 24)
        field.textAlignment = .center
        field.backgroundColor = .systemBackground
        field.layer.cornerRadius = 16
        
        return field
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .label
        
        return label
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 16
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        resetVC()
    }
    
    func resetVC() {
        questionField.text = ""
        option1Field.text = ""
        option2Field.text = ""
        solutionArray.removeAll()
        
        view.becomeFirstResponder()
    }
    
    func configure() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        view.addSubview(questionField)
        view.addSubview(option1Field)
        view.addSubview(option2Field)
        view.addSubview(orLabel)
        view.addSubview(submitButton)
        
        submitButton.addTarget(self, action: #selector(solutionTime), for: .touchUpInside)
        
        questionField.translatesAutoresizingMaskIntoConstraints = false
        option1Field.translatesAutoresizingMaskIntoConstraints = false
        option2Field.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            questionField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            questionField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            questionField.heightAnchor.constraint(equalToConstant: 50),
            
            option1Field.topAnchor.constraint(equalTo: questionField.bottomAnchor, constant: 50),
            option1Field.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            option1Field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            option1Field.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            option1Field.heightAnchor.constraint(equalToConstant: 50),
            
            orLabel.topAnchor.constraint(equalTo: option1Field.bottomAnchor, constant: 5),
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            option2Field.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 5),
            option2Field.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            option2Field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            option2Field.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            option2Field.heightAnchor.constraint(equalToConstant: 50),
            
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: 150),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            ])
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func solutionTime() {
        let answerPage = AnswerViewController()
        
        if questionField.text == "" {
            let questionAlert = UIAlertController(title: "Problem", message: "Please enter a question", preferredStyle: .alert)
            questionAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(questionAlert, animated: true, completion: nil)
        } else if option1Field.text == "" || option2Field.text == "" {
            let alert = UIAlertController(title: "Problem", message: "Please enter two options", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            solutionArray.append(option1Field.text!)
            solutionArray.append(option2Field.text!)
            
            let randomNumber = Int.random(in: 0..<count)
            
            answerPage.questionLabel.text = "Question \n \(questionField.text!)?"
            questions = questionField.text!
            answerPage.answerLabel.text = "The answer is... \n \(solutionArray[randomNumber])"
            answers = solutionArray[randomNumber]
            
            print("\(answerPage.answerLabel.text!) , and \(solutionArray.count)")
            
            navigationController?.pushViewController(answerPage, animated: true)
        }
        
 
    }


}

