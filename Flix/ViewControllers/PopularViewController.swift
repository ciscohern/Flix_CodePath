//
//  PopularViewController.swift
//  Flix
//
//  Created by Francisco Hernanedez on 10/5/18.
//  Copyright © 2018 Francisco Hernanedz. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        // Do any additional setup after loading the view.
        let layout = popularCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 2
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let width = popularCollectionView.frame.size.width / cellsPerLine - interItemSpacingTotal / cellsPerLine
        layout.itemSize = CGSize(width: width, height: width * 3/2)
        fetchMovies()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath ) as! PopularCell
        let movie = movies[indexPath.item]
        let posterURL = movie.posterUrl
        cell.popularImageView.af_setImage(withURL: posterURL!)
        return cell
    }
    
    
    func fetchMovies(){
        MovieApiManager().popularMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.popularCollectionView.reloadData()
                
            }
        }
    }
    
}
