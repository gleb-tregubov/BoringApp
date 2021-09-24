//
//  SavedActivitiesViewController.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 24.09.2021.
//

import UIKit

class SavedActivitiesViewController: UIViewController {
    
    var dataSource = [SavedActivityModel]()
    
    lazy var activitiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
    
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.register(ActivityCollectionViewCell.self, forCellWithReuseIdentifier: ActivityCollectionViewCell.reuseIdentifier)
        
        view.backgroundColor = .clear
        view.alwaysBounceVertical = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.delegate = self
        view.dataSource = self
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        activitiesCollectionView.reloadData()
    }
    
    private func setupAppearance() {
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupActivitiesCollectionView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Saved Activities 📋"
        
        let config = UIImage.SymbolConfiguration(pointSize: 30.0, weight: .black, scale: .large)
        
        let addActivityRightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill", withConfiguration: config), style: .plain, target: self, action: #selector(addActivityTapped))
        
        addActivityRightBarButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = addActivityRightBarButton
        
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc private func addActivityTapped() {
        
    }
    
    private func setupActivitiesCollectionView() {
        view.addSubview(activitiesCollectionView)
        
        NSLayoutConstraint.activate([
            activitiesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            activitiesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            activitiesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            activitiesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
