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

class MainVC: UIViewController {
    
    @IBOutlet var moviesCollView: UICollectionView!
    @IBOutlet weak var headerHightConstraint: NSLayoutConstraint!
    
    let images = ["movie_pic1", "movie_pic2", "movie_pic3", "movie_pic1", "movie_pic2", "movie_pic3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        moviesCollView.delegate = self
        moviesCollView.dataSource = self
        moviesCollView.collectionViewLayout = UICollectionViewFlowLayout()
        
        if Constants.UIScreen.topSafeArea ?? 0 < 21{
            headerHightConstraint.constant = 90
        }
    }
    
    @IBAction func actSearch(_ sender: Any) {
        
        MainViewModel.goToSearchVC(navigationController: self.navigationController)
        
    }
}

extension MainVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        MainViewModel.goToMovieDetailVC(navigationController: self.navigationController)
    }
}

extension MainVC: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        6
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.bgImg.image = UIImage(named: images[indexPath.section])
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
