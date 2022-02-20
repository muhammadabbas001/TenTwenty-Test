//
//  ViewController.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 18/02/2022.
//

import UIKit

//
//  MainViewController.swift
//  YTS
//
//  Created by Muhammad Abbas on 21/09/2021.
//

import UIKit
import SDWebImage

class MainVC: UIViewController {
    
    @IBOutlet var moviesCollView: UICollectionView!
    @IBOutlet weak var headerHightConstraint: NSLayoutConstraint!
    
    let images = ["movie_pic1", "movie_pic2", "movie_pic3", "movie_pic1", "movie_pic2", "movie_pic3"]
    
    var moviesData: MoviesData? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        moviesCollView.delegate = self
        moviesCollView.dataSource = self
        moviesCollView.collectionViewLayout = UICollectionViewFlowLayout()
        
        if Constants.UIScreen.topSafeArea ?? 0 < 21{
            headerHightConstraint.constant = 90
        }
        
        getUpCommingMoviesRequest()
        
    }
    
    func getUpCommingMoviesRequest(){
        MainViewModel.getUpcomingMovies{ moviesData, error in
            if let error = error {
                print(error)
            }else{
                self.moviesData = moviesData
                DispatchQueue.main.async {
                    self.moviesCollView.reloadData()
                }
            }
        }
    }
    
    @IBAction func actSearch(_ sender: Any) {
        
        MainViewModel.goToSearchVC(navigationController: self.navigationController)
        
    }
}

extension MainVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.moviesData?.results[indexPath.section]
        MainViewModel.goToMovieDetailVC(navigationController: self.navigationController, bgImg: "\(Constants.ServerConfig.IMAGE_BASE_URL)\(movie?.posterPath ?? "")", releaseData: movie?.releaseDate ?? "", overview: movie?.overview ?? "")
    }
}

extension MainVC: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.moviesData?.results.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        let movie = self.moviesData?.results[indexPath.section]
        cell.bgImg.sd_setImage(with: URL(string: "\(Constants.ServerConfig.IMAGE_BASE_URL)\(movie?.posterPath ?? "")"), placeholderImage: UIImage(named: "placeholder.png"))
        cell.title.text = movie?.title ?? ""
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
}

extension MainVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-40, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return section == 0 ? UIEdgeInsets(top: 30, left: 0, bottom: 20, right: 0) : UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
}
