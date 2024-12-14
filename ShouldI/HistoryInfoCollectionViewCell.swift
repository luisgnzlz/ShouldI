//
//  HistoryInfoCollectionViewCell.swift
//  ShouldI
//
//  Created by Luis Gonzalez on 12/13/24.
//

import UIKit

class HistoryInfoCollectionViewCell: UICollectionViewCell {
    
    var questionLabel = UILabel()
    var answerLabel = UILabel()
    var underlineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    func configure() {
        backgroundColor = .systemBackground
        
        questionLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        questionLabel.numberOfLines = 0
        questionLabel.textColor = .label
        
        answerLabel.font = .systemFont(ofSize: 24, weight: .regular)
        answerLabel.numberOfLines = 0
        answerLabel.textColor = .secondaryLabel
        
        underlineView.backgroundColor = .systemGray
        
        
        addSubview(questionLabel)
        addSubview(answerLabel)
        addSubview(underlineView)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            answerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            answerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
