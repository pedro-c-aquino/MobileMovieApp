//
//  UpcomingView.swift
//  DesafioMobile2019Teste14
//
//  Created by Vinicius Angelo on 27/09/22.
//

import UIKit

class UpcomingView: UIViewController {
    
    private var resultArray: [Result] = []
    
    private let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        networkManager.getMovies(movieType: "popular") { (popularMovies: PopularModel) in
            print(popularMovies)
        }
        
        // Do any additional setup after loading the view.
    }


}
