//
//  SavedActivitiesViewController.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 24.09.2021.
//

import UIKit
import SPAlert
import CoreData

class SavedActivitiesViewController: UIViewController {
    
    private let viewContext: NSManagedObjectContext = {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.automaticallyMergesChangesFromParent = true
        
        return context
    }()
    
    var dataSource = [Activity]()
    
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
        
        let alert = UIAlertController(title: "New activity", message: "You can add your custom actitvity", preferredStyle: .alert)

        alert.addTextField { activityTextField in
            activityTextField.text = ""
            activityTextField.placeholder = "Activity"
        }

        alert.addTextField { categoryTypeTextField in
            categoryTypeTextField.text = ""
            categoryTypeTextField.placeholder = "Activity Type"
        }

        alert.addTextField { participantsTextField in
            participantsTextField.text = ""
            participantsTextField.placeholder = "Participants number"
        }

        alert.addTextField { priceTextField in
            priceTextField.text = ""
            priceTextField.placeholder = "price in usd, like x.y"
        }

        alert.addAction(UIAlertAction(title: "CheckOut", style: .default, handler: { [weak self, alert] (_) in
            let activityTextField = alert.textFields![0]
            let categoryTypeTextField = alert.textFields![1]
            let participantsTextField = alert.textFields![2]
            let priceTextField = alert.textFields![3]

            let actitivy = activityTextField.text
            let type = categoryTypeTextField.text
            let participants = participantsTextField.text
            let price = priceTextField.text

            if (
                    actitivy == ""
                || type == ""
                || participants == ""
                || price == ""
            ) {
                SPAlert.present(title: "Empty field", message: "Please enter your data to field", preset: .error, haptic: .error, completion: nil)
            } else {
                let customActivity = SavedActivityModel(
                    activity: actitivy!,
                    type: type!,
                    participants: Int(participants!) ?? 1,
                    price: Double(price!) ?? 0.0,
                    color: .systemBlue
                )

                if !CoreDataManager.isActivityExist(currentActivity: customActivity, onContext: self!.viewContext) {

                    self?.dataSource.append(CoreDataManager.saveActitvity(currentActivity: customActivity, onContext: self!.viewContext))
                    
                    self?.activitiesCollectionView.insertItems(at: [IndexPath(row: (self?.dataSource.count)! - 1, section: 0)])
                    
                    SPAlert.present(title: "Activity saved", preset: .done)
                }
            }

            
        }))

        self.present(alert, animated: true, completion: nil)
        
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
