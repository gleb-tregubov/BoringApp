//
//  ViewController.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 21.09.2021.
//

import UIKit

class BoredAppViewController: UIViewController {
    
    let parametersVC = ParametersViewController()
    
    private let scrollView: UIScrollView = {
        
        let view = UIScrollView()
        
        view.alwaysBounceVertical = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let againButton: UIButton = {
        let view = UIButton()
        
        let config = UIImage.SymbolConfiguration(pointSize: 50.0, weight: .black, scale: .large)
        
        view.setImage(UIImage(systemName: "arrow.triangle.2.circlepath.circle.fill", withConfiguration: config), for: .normal)
        
        view.tintColor = .black
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let cardView = CardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
    }
    
    private func setupAppearance() {
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupScrollView()
        setupAgainButton()
        setupCardView()
    }
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Boring App 🥱"
            
        navigationItem.largeTitleDisplayMode = .always
        
        let config = UIImage.SymbolConfiguration(pointSize: 30.0, weight: .black, scale: .large)
        
        let settingsRightBarButton = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3", withConfiguration: config), style: .plain, target: self, action: #selector(settingsTapped))
        
        settingsRightBarButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = settingsRightBarButton
    }
    
    @objc private func settingsTapped() {
        print("settings tapped")
        
        navigationController?.present(parametersVC, animated: true, completion: nil)
        
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupAgainButton() {
        scrollView.addSubview(againButton)
        
        NSLayoutConstraint.activate([
            againButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 60.0),
            againButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    
    private func setupCardView() {
        scrollView.addSubview(cardView)
        
        
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.0),
            cardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16.0),
            cardView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16.0 - 16.0),
            cardView.heightAnchor.constraint(equalToConstant: 486.0),
            
            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20.0),
            cardView.bottomAnchor.constraint(equalTo: againButton.topAnchor, constant: -48.0)
        ])
    }


}

