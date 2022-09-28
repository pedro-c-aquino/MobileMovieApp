//
//  PopularMoviesCell.swift
//  DesafioMobile2019Teste14
//
//  Created by user220270 on 9/28/22.
//

import Foundation
import UIKit

class PopularMoviesCell: UICollectionViewCell{
    
    var reuseId = "cell"
    
    private lazy var movieBanner:UIImageView = {
        let movieBanner = UIImageView()
         movieBanner.translatesAutoresizingMaskIntoConstraints = false
        movieBanner.image = UIImage(named: "download")
        return movieBanner
    }()
    private lazy var labelDate: UILabel = {
        let labelDate = UILabel()
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.text = "06/06/06"
        labelDate.textColor = .white
        return labelDate
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(movieBanner)
        contentView.addSubview(labelDate)
        setupConstrants()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupConstrants () {
        NSLayoutConstraint.activate([
        movieBanner.topAnchor.constraint(equalTo: contentView.topAnchor),
        movieBanner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        movieBanner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
        labelDate.bottomAnchor.constraint(equalTo: movieBanner.bottomAnchor, constant: -5),
        labelDate.centerXAnchor.constraint(equalTo: movieBanner.centerXAnchor)
      ])
    }
}
