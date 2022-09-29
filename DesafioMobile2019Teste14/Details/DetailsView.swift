//
//  DetailsView.swift
//  DesafioMobile2019Teste14
//
//  Created by Vinicius Angelo on 27/09/22.
//


import UIKit

class DetailsView: UIViewController{
    
    private let detailsViewModel = DetailsViewModel()
    var cast:[Cast] = []
    var movieId: Int?
    let cell = "Cell"
    var movieDetails: MovieDetails?
    
    private let backButton : UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(systemName: "chevron.left"), for:.normal)
        backButton.tintColor = .red
        backButton.addTarget(self, action: #selector(tapDismiss), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
        
    }()
    lazy var detailImage : UIImageView = {
        let detailImage = UIImageView()
        detailImage.backgroundColor = .red
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        return detailImage
        
    }()
    
    lazy var filmInfoLabel : UILabel = {
        let filmInfoLabel = UILabel()
        filmInfoLabel.font = UIFont.systemFont(ofSize: 18.0)
        filmInfoLabel.text = "\(movieDetails?.runtime ?? 0)m | "
        filmInfoLabel.textColor = .gray
        filmInfoLabel.numberOfLines = 0
        filmInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        return filmInfoLabel
        
    }()
    
    lazy var genreLabel : UILabel = {
        let genreLabel = UILabel()
        genreLabel.font = UIFont.systemFont(ofSize: 18.0)
        genreLabel.text = detailsViewModel.getGenresString(genresArray: movieDetails?.genres)
        genreLabel.textColor = .gray
        genreLabel.numberOfLines = 0
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        return genreLabel
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
    
     lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
         titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
         titleLabel.text = "TEST"
         titleLabel.numberOfLines = 0
         titleLabel.textColor = .white
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel(frame: .zero)
        dateLabel.font = UIFont.systemFont(ofSize: 18.0)
        dateLabel.text = detailsViewModel.getYearString(dateString: movieDetails?.release_date)
        dateLabel.numberOfLines = 0
        dateLabel.textColor = .lightGray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    private lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize.height = 150
        layout.itemSize.width = view.frame.width/3
        let colection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colection.backgroundColor = #colorLiteral(red: 0.1215686426, green: 0.1215686426, blue: 0.1215686426, alpha: 1)
        colection.dataSource = self
        colection.delegate = self
        colection.translatesAutoresizingMaskIntoConstraints = false
        

        colection.register(DetailsViewCell.self, forCellWithReuseIdentifier: cell)
        return colection
    }()

    lazy var descriptionFilm : UILabel = {
        let descriptionFilm = UILabel()
        descriptionFilm.font = UIFont.systemFont(ofSize: 15.0)
        descriptionFilm.text = "test description film "
        descriptionFilm.numberOfLines = 0
        descriptionFilm.translatesAutoresizingMaskIntoConstraints = false
        descriptionFilm.textColor = .white
        return descriptionFilm
        
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = #colorLiteral(red: 0.1215686426, green: 0.1215686426, blue: 0.1215686426, alpha: 1)
        
        scrollView.addSubview(viewInScroll)
        viewInScroll.addSubview(detailImage)
        viewInScroll.addSubview(backButton)
        viewInScroll.addSubview(titleLabel)
        viewInScroll.addSubview(dateLabel)
        viewInScroll.addSubview(filmInfoLabel)
        viewInScroll.addSubview(genreLabel)
        viewInScroll.addSubview(collectionView)
        viewInScroll.addSubview(descriptionFilm)
        viewInScroll.addSubview(lineView)
        view.addSubview(scrollView)
        setupContraints()
        super.viewDidLoad()
        print("teste",cast)
        
    }
    
    func setupContraints(){
        
        NSLayoutConstraint.activate([
            
            detailImage.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            detailImage.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            detailImage.topAnchor.constraint(equalTo: viewInScroll.topAnchor),
            detailImage.heightAnchor.constraint(equalToConstant: 350),
            
            backButton.leadingAnchor.constraint(equalTo: detailImage.leadingAnchor, constant: 12),
            backButton.topAnchor.constraint(equalTo: detailImage.topAnchor, constant: 10),
            
            titleLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            titleLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor,constant: 20),
            
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 50),
            dateLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 20),
            
            filmInfoLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            filmInfoLabel.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            filmInfoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 12),
            
            genreLabel.leadingAnchor.constraint(equalTo: filmInfoLabel.leadingAnchor, constant: 50),
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            
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
     
        ])
    }
    
    @objc private func tapDismiss(){
        
        self.dismiss(animated: true)
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
