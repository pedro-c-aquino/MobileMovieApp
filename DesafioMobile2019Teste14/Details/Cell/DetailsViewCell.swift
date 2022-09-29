//
//  DetailsViewCell.swift
//  DesafioMobile2019Teste14
//
//  Created by user218968 on 9/28/22.
//


import UIKit

class DetailsViewCell: UICollectionViewCell, SetupView {
    
    let movieImage: UIImageView = {
        let movieImage = UIImageView()
        movieImage.backgroundColor = .cyan
        
        return movieImage
    }()
    
    let actorsNameLabel: UILabel = {
        let movieDateLabel = UILabel()
        movieDateLabel.text = "TEST1"
        movieDateLabel.numberOfLines = 0
        movieDateLabel.textColor = .gray
        
        return movieDateLabel
        
    }()
    
    lazy var actorsRoleLabel: UILabel = {
        let actorsRoleLabel = UILabel(frame: .zero)
        actorsRoleLabel.text = "TEST2"
        actorsRoleLabel.numberOfLines = 0
        actorsRoleLabel.textColor = .gray
        actorsRoleLabel.translatesAutoresizingMaskIntoConstraints = false
        return actorsRoleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        
        contentView.backgroundColor = .orange
        
    }
    
    func setupConstraints() {
        
        contentView.addSubview(movieImage)
        contentView.addSubview(actorsNameLabel)
        contentView.addSubview(actorsRoleLabel)
        
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        actorsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        actorsRoleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        movieImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        actorsNameLabel.centerXAnchor.constraint(equalTo: movieImage.centerXAnchor).isActive = true
        actorsNameLabel.bottomAnchor.constraint(equalTo: actorsRoleLabel.topAnchor).isActive = true
        
        actorsRoleLabel.centerXAnchor.constraint(equalTo: movieImage.centerXAnchor).isActive = true
        actorsRoleLabel.bottomAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: -10).isActive = true
    
    }
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
