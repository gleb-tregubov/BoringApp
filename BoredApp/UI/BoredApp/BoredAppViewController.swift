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
        startLoading()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        let activity = parametersVC.activity ?? "0"
//        let activityColor = parametersVC.activityColor ?? UIColor(rgb: 0x828282)
//
//        cardView.categorieTypeLabel.configure(withText: activity, backgroundColor: activityColor)
//    }
    
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
//        print("settings tapped")
        
//        parametersVC.modalPresentationStyle = .fullScreen
//        parametersVC.boredAppVC = self
        self.present(parametersVC, animated: true, completion: nil)

        
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
        
        againButton.addTarget(self, action: #selector(againButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            againButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 60.0),
            againButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
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
    
    private func startLoading(params: UserActivityChoice? = nil) {
        
        self.services.loadActivity(withParams: params) { [weak self] activity, error in
            DispatchQueue.main.async {
                
                if let _ = error {
                    
                    SPAlert.present(title: "not found", message: "😔 pls change condition", preset: .custom(UIImage(systemName: "xmark") ?? .checkmark), haptic: .error, completion: nil)
                    
                    return
                }
                
                if let data = activity {
                    self?.cardView.activityLabel.text = data.activity
                    self?.cardView.categorieTypeLabel.text = data.type
                    self?.cardView.participantsNumberLabel.text = "\(data.participants)"
                    self?.cardView.priceValueLabel.text = data.price == 0.0 ? "free" : "\(data.price)"
                    self?.cardView.categorieTypeLabel.backgroundColor = self?.parametersVC.activityColor ?? UIColor(withRandomColor: ())
                }
            }
        }
        
    }

}

