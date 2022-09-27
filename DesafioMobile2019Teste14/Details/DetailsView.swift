//
//  DetailsView.swift
//  DesafioMobile2019Teste14
//
//  Created by Vinicius Angelo on 27/09/22.
//

import UIKit

class DetailsView: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont(name: "Kailase", size: 10)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private let yearLabel: UILabel = {
        let yearLabel = UILabel(frame: .zero)
        yearLabel.textAlignment = .center
        yearLabel.textColor = .white
        yearLabel.numberOfLines = 0
        return yearLabel
    }()
    
    private let genresLabel: UILabel = {
        let genresLabel = UILabel(frame: .zero)
        genresLabel.font = UIFont(name: "Kailase", size: 3)
        genresLabel.textColor = .white
        genresLabel.adjustsFontSizeToFitWidth = true
        genresLabel.numberOfLines = 1
        return genresLabel
    }()
    
    private let castView: UICollectionView = {
       let castViewLayout = UICollectionViewFlowLayout()
        castViewLayout.scrollDirection = .horizontal
       let castView = UICollectionView(frame: .zero, collectionViewLayout: castViewLayout)
        castView.backgroundColor = .black
       return castView
    }()
    
    private let verticalContainer: UIView = {
        let verticalContainer = UIView(frame: .zero)
        verticalContainer.backgroundColor = .black
        return verticalContainer
    }()
    
    private let descLabel: UILabel = {
        let descLabel = UILabel(frame: .zero)
        descLabel.textColor = .white
        descLabel.adjustsFontSizeToFitWidth = true
        descLabel.numberOfLines = 0
        return descLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
    }


}

