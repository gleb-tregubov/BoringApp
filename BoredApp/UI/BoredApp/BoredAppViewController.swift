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
import CoreData

class BoredAppViewController: UIViewController {
    
    private let viewContext: NSManagedObjectContext = {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.automaticallyMergesChangesFromParent = true
        
        return context
    }()
    
    private let newBackgroundContext: NSManagedObjectContext = {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
        
        context.automaticallyMergesChangesFromParent = true
        
        return context
    }()
    
    let services: ServicesProtocol = Services()
    
    let parametersVC = ParametersViewController()
    
    let savedActivitiesVC = SavedActivitiesViewController()
    
    var currentActivity: SavedActivityModel?
    
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
        savedActivitiesVC.dataSource = CoreDataManager.fetchActivities(onContext: viewContext)
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
        
        if let currentActivity = self.currentActivity {
            if (!CoreDataManager.isActivityExist(currentActivity: currentActivity, onContext: newBackgroundContext)) {
                let context = newBackgroundContext
                
                let activity = CoreDataManager.saveActitvity(currentActivity: currentActivity, onContext: context)
                
                savedActivitiesVC.dataSource.append(activity)
                
                savedActivitiesVC.activitiesCollectionView.insertItems(at: [IndexPath(row: savedActivitiesVC.dataSource.count - 1, section: 0)])
                
                SPAlert.present(title: "Activity saved", preset: .done)
                
                return
            } else {
                SPAlert.present(title: "already exist", message: "You already saved this activity", preset: .custom(UIImage(systemName: "exclamationmark.circle") ?? .checkmark), haptic: .warning, completion: nil)
            }
        } else {
            SPAlert.present(title: "Error", preset: .error)
        }
        
    }
    
    @objc private func againButtonTapped() {
        
        let userActivityChoice = UserActivityChoiceModel(
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

