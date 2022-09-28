//
//  DetailsViewCell.swift
//  DesafioMobile2019Teste14
//
//  Created by user218968 on 9/28/22.
//


import UIKit

class DetailsViewCell: UICollectionViewCell, SetupView {
    
    let movieImage: UIImageView = {
        
        let imageview = UIImageView()
        imageview.backgroundColor = .cyan
        
        return imageview
    }()
    
    let movieDateLabel: UILabel = {
        
        let movieDateLabel = UILabel()
        movieDateLabel.numberOfLines = 0
        movieDateLabel.text = "TEST"
        
        return movieDateLabel
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        
        contentView.backgroundColor = .red
    }
    
    func setupConstraints() {
        
        contentView.addSubview(movieImage)
        contentView.addSubview(movieDateLabel)
        
        movieImage.translatesAutoresizingMaskIntoConstraints = false
       
        movieDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        movieImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        movieDateLabel.centerXAnchor.constraint(equalTo: movieImage.centerXAnchor).isActive = true
        movieDateLabel.bottomAnchor.constraint(equalTo: movieImage.bottomAnchor).isActive = true
        
      
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
