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
        return label
    }()
    
    lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.text = "Swift"
        return label
    }()
    
    lazy var starsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "123"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "description should be here"
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
        contentView.addSubviews(repoNameLabel, starsLabel, descriptionLabel, languageLabel)
    }
    
    func configureContraints() {
        repoNameLabel.easy.layout([ Top(20), Left(20)])
        starsLabel.easy.layout([Top(20), Right(20)])
        descriptionLabel.easy.layout([Top(10).to(repoNameLabel), Left(20)])
        languageLabel.easy.layout([Top(10).to(descriptionLabel), Left(20)])
    }
}
