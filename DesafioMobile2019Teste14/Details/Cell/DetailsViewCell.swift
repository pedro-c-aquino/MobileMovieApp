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
    
    let movieDateLabel: UILabel = {
        let movieDateLabel = UILabel()
        movieDateLabel.numberOfLines = 0
        let actorName = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)
                         , NSAttributedString.Key.foregroundColor : UIColor.white]
        let actorRole = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)
                         , NSAttributedString.Key.foregroundColor : UIColor.white]
        
        let attName = NSMutableAttributedString(string: "TEST TEST", attributes: actorName as [NSAttributedString.Key : Any])
        let attRole = NSMutableAttributedString(string: "\nTest (test)", attributes: actorRole as [NSAttributedString.Key : Any])
        attName.append(attRole)
        movieDateLabel.attributedText = attName
        
        return movieDateLabel
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        
        contentView.backgroundColor = .gray
        
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
