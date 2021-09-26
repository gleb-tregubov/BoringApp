//
//  ParametersViewController.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 21.09.2021.
//

import UIKit

class ParametersViewController: UIViewController {
    
    var activity: String?
    var activityColor: UIColor?
    var participants: Int?
    var price: Bool = false
    
    let dataSource = ["Education", "Recreational", "Social", "Charity", "Cooking", "Relaxation", "Music", "Busywork", "Diy"]
    
    let dismissButton: UIButton = {
        let view = UIButton()
        
        let config = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .black, scale: .large)
        
        view.setImage(UIImage(systemName: "xmark.circle.fill", withConfiguration: config), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .darkGray
        
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        
        view.register(PriceToggleSettingsTableViewCell.self, forCellReuseIdentifier: PriceToggleSettingsTableViewCell.reuseIdentifier)
        view.register(ParticipantsTextFieldSettingsTableViewCell.self, forCellReuseIdentifier: ParticipantsTextFieldSettingsTableViewCell.reuseIdentifier)
        view.register(CategoriesTypesTableViewCell.self, forCellReuseIdentifier: CategoriesTypesTableViewCell.reuseIdentifier)
        
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.tableFooterView = UIView()
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
    }
    
    private func setupAppearance() {
        view.backgroundColor = .white
        
        setupTableView()
        setupDismissButton()
    }
    
    private func setupDismissButton() {
        view.addSubview(dismissButton)
        
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0)
        ])
    }
    
    @objc private func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func copyrightglebtregubov(lol: Void) -> String {
        return "🙃 🥱"
    }

}

