//
//  ViewController.swift
//  githubmobi
//
//  Created by Danagul Otel on 23.07.2018.
//  Copyright © 2018 Danagul Otel. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var repos = [Repo]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: view.bounds.width - 20, height: 130)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(RepoCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "repoCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSalons()
        configureSearchController()
        configureViews()
        configureContraints()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search repos"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    func configureViews() {
        view.backgroundColor = .white
        title = "Github repos"
        view.addSubview(collectionView)
    }
    
    func configureContraints() {
        collectionView.easy.layout(Edges(0))
    }
    
    func fetchSalons() {
        let topic = "face recognition"
        
        Repo.fetchSalons(with: topic) { (repo, error) in
            if(error != nil){
                print("error")
            }else{
                self.repos.append(repo!)
            }
        }
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = WebViewController()
        vc.repoUrl = repos[indexPath.row].webUrl ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "repoCell", for: indexPath) as! RepoCollectionViewCell
        let repo = repos[indexPath.row]
        cell.repoNameLabel.text = repo.name
        cell.starsLabel.text = "★\(repo.stars ?? 0)"
        cell.descriptionLabel.text = repo.description
        cell.languageLabel.text = repo.language
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repos.count
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}
