//
//  UpcomingView.swift
//  DesafioMobile2019Teste14
//
//  Created by Vinicius Angelo on 27/09/22.
//

import UIKit

class UpcomingView: UIViewController {
    

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Upcoming", "Popular"])
        control.backgroundColor = UIColor.black
        control.layer.borderColor = UIColor.white.cgColor
        control.selectedSegmentTintColor = UIColor.white
        control.layer.borderWidth = 1
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        control.setTitleTextAttributes(titleTextAttributes, for:.normal)
            let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1215686426, green: 0.1215686426, blue: 0.1215686426, alpha: 1) ]
        control.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        control.addTarget(nil, action: #selector(changeScreen), for: .valueChanged)
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.text = "Upcoming Movies"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = #colorLiteral(red: 0.1999999881, green: 0.1999999881, blue: 0.1999999881, alpha: 1)
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1215686426, green: 0.1215686426, blue: 0.1215686426, alpha: 1)
        
        setupViews()
        setupContraints()
    }
    
    private func setupViews() {
        
        view.addSubview(segmentedControl)
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
        
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 35),
            segmentedControl.widthAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])
    }
    
    @objc func changeScreen() {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            titleLabel.text = "Upcoming Movies"
        } else {
            titleLabel.text = "Popular Movies"
        }
    }
}

extension UpcomingView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/3.4, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
        
}

