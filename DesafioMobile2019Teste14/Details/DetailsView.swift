//
//  DetailsView.swift
//  DesafioMobile2019Teste14
//
//  Created by Vinicius Angelo on 27/09/22.
//


import UIKit

class DetailsView: UIViewController{
    

    
    let cell = "Cell"
    
    
    
    private let scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.bounces = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
        
    }()
    private let detailImage : UIImageView = {
        let detailImage = UIImageView()
        detailImage.backgroundColor = .red
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        return detailImage
        
    }()
    
    private let filmInfoLabel : UILabel = {
        let filmInfoLabel = UILabel()
        filmInfoLabel.text = "120m"
        filmInfoLabel.numberOfLines = 0
        filmInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        filmInfoLabel.textColor = .white
        return filmInfoLabel
        
    }()
    
    private let viewInScroll : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lineView : UIView = {
        let lineView  = UIView()
        lineView .backgroundColor = .gray
        lineView .translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
  
        let filmName = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)
                        , NSAttributedString.Key.foregroundColor : UIColor.white]
        
        
        let filmDate = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)
                        , NSAttributedString.Key.foregroundColor : UIColor.gray]
        
        let attString1 = NSMutableAttributedString(string: "TEST ", attributes: filmName as [NSAttributedString.Key : Any])
        
        let attString2 = NSMutableAttributedString(string: "2022", attributes: filmDate as [NSAttributedString.Key : Any])
        
        attString1.append(attString2)
        titleLabel.attributedText = attString1
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize.height = 150
        layout.itemSize.width = view.frame.width/3
        let colection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colection.dataSource = self
        colection.delegate = self
        colection.translatesAutoresizingMaskIntoConstraints = false
        

        colection.register(DetailsViewCell.self, forCellWithReuseIdentifier: cell)
        return colection
    }()
    
    
    private let descriptionFilm : UILabel = {
        let descriptionFilm = UILabel()
        descriptionFilm.text = "TEST  TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST "
        descriptionFilm.numberOfLines = 0
        descriptionFilm.translatesAutoresizingMaskIntoConstraints = false
        descriptionFilm.textColor = .white
        return descriptionFilm
        
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .black
        
        scrollView.addSubview(viewInScroll)
        viewInScroll.addSubview(detailImage)
        viewInScroll.addSubview(titleLabel)
        viewInScroll.addSubview(filmInfoLabel)
        viewInScroll.addSubview(collectionView)
        viewInScroll.addSubview(descriptionFilm)
        viewInScroll.addSubview(lineView)
        view.addSubview(scrollView)
        setupContraints()
        super.viewDidLoad()
        
        
    }
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            
            detailImage.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            detailImage.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            detailImage.topAnchor.constraint(equalTo: viewInScroll.topAnchor),
            detailImage.heightAnchor.constraint(equalToConstant: 350),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            titleLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor,constant: 20),
            
            filmInfoLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            filmInfoLabel.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            filmInfoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 12),
            
            collectionView.topAnchor.constraint(equalTo: filmInfoLabel.bottomAnchor,constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 150),
            
            lineView.leadingAnchor.constraint(equalTo: descriptionFilm.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: descriptionFilm.trailingAnchor),
            lineView.topAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 12),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            descriptionFilm.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant: 12),
            descriptionFilm.bottomAnchor.constraint(equalTo: viewInScroll.bottomAnchor),
            descriptionFilm.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionFilm.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            
            viewInScroll.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            viewInScroll.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            viewInScroll.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            viewInScroll.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            viewInScroll.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//
            
     
        ])
        
    }
}

extension DetailsView:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as? DetailsViewCell
        
        return  cell ?? UICollectionViewCell()
    }
}
