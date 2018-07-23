//
//  RepoCollectionViewCell.swift
//  githubmobi
//
//  Created by Danagul Otel on 23.07.2018.
//  Copyright © 2018 Danagul Otel. All rights reserved.
//

import UIKit
import EasyPeasy
import Sugar

class RepoCollectionViewCell: UICollectionViewCell {
    
    lazy var repoNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Repo"
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.text = "Swift"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var starsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "123"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "description should be here"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        contentView.backgroundColor = .white
        contentView.addSubviews(repoNameLabel, starsLabel, descriptionLabel, languageLabel)
    }
    
    func configureContraints() {
        repoNameLabel.easy.layout([ Top(10), Left(10), Width(self.bounds.width - 50)])
        starsLabel.easy.layout([Top(10), Right(10)])
        descriptionLabel.easy.layout([Top(10).to(repoNameLabel), Left(10), Right(10)])
        languageLabel.easy.layout([Top(10).to(descriptionLabel), Left(10)])
    }
}
