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
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.separatorStyle = .singleLine
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.navigationBar.backgroundColor = .red
        view.backgroundColor = #colorLiteral(red: 0.1215686426, green: 0.1215686426, blue: 0.1215686426, alpha: 1)
        
        setupViews()
        setupContraints()
        
    }
    
    private func setupViews() {
        
        view.addSubview(segmentedControl)
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
        
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            
            titleLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        
        ])
    }
}

extension UpcomingView: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
