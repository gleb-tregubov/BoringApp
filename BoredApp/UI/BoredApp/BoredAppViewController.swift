//
//  ViewController.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 21.09.2021.
//

// 😈
// be careful
// check Main.storyboard
// drink water

import UIKit
import SPAlert

class BoredAppViewController: UIViewController {
    
    let services: ServicesProtocol = Services()
    
    let parametersVC = ParametersViewController()
    
    let savedActivitiesVC = SavedActivitiesViewController()
    
    var currentActivity: SavedActivityModel!
    
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
    
    private let saveActivityButton: UIButton = {
        let view = UIButton()
        
        let config = UIImage.SymbolConfiguration(pointSize: 50.0, weight: .black, scale: .large)
        
        view.setImage(UIImage(systemName: "rectangle.stack.badge.plus", withConfiguration: config), for: .normal)
        
        view.tintColor = .black
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let buttonsStackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .horizontal
        view.spacing = 150.0
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let cardView = CardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        startLoading()
    }
    
    
    private func setupAppearance() {
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupScrollView()
        setupButtonsStackView()
        setupCardView()
    }
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Boring App 🥱"
            
        navigationItem.largeTitleDisplayMode = .always
        
        let config = UIImage.SymbolConfiguration(pointSize: 30.0, weight: .black, scale: .large)
        
        let settingsRightBarButton = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3", withConfiguration: config), style: .plain, target: self, action: #selector(settingsTapped))
        
        settingsRightBarButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = settingsRightBarButton
        
        let activityStackLeftBarButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.stack", withConfiguration: config), style: .plain, target: self, action: #selector(activitiesStackTapped))
        
        activityStackLeftBarButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = activityStackLeftBarButton
    }
    
    @objc private func settingsTapped() {
        self.present(parametersVC, animated: true, completion: nil)
    }
    
    @objc private func activitiesStackTapped() {
        navigationController?.pushViewController(savedActivitiesVC, animated: true)
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
    
    private func setupButtonsStackView() {
        buttonsStackView.addArrangedSubview(saveActivityButton)
        buttonsStackView.addArrangedSubview(againButton)
        
        saveActivityButton.addTarget(self, action: #selector(saveActivityButtonTapped), for: .touchUpInside)
        againButton.addTarget(self, action: #selector(againButtonTapped), for: .touchUpInside)
        
        scrollView.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 60.0),
            buttonsStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
        
    @objc private func saveActivityButtonTapped() {
        print("saveActivityButton tapped")
        
        print(savedActivitiesVC.dataSource.last == currentActivity)
        
        var alreadyExist = false
        
        savedActivitiesVC.dataSource.forEach { activity in
            if activity == currentActivity {
                alreadyExist = true
                
                SPAlert.present(title: "already exist", message: "You already saved this activity", preset: .custom(UIImage(systemName: "exclamationmark.circle") ?? .checkmark), haptic: .warning, completion: nil)
                
                return
            }
        }
        
        if !alreadyExist {
            savedActivitiesVC.dataSource.append(currentActivity)
            SPAlert.present(title: "Activity saved", preset: .done)
        }
        
        // TODO: - Alert
    }
    
    @objc private func againButtonTapped() {
//        print("againButton tapped")
        
        let userActivityChoice = UserActivityChoice(
            type: parametersVC.activity?.lowercased(),
            participants: parametersVC.participants,
            price: parametersVC.price)
        
        print("-------------------------------------------")
        print("!!! USER TYPE: \(userActivityChoice.type ?? "nil")")
        print("!!! USER PARTICIPANTS: \(String(describing: userActivityChoice.participants))")
        print("!!! USER PRICE: \(userActivityChoice.price)")
        
        startLoading(params: userActivityChoice)
        
        
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

