//
//  SearchMovieVC.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 19/02/2022.
//

import UIKit

class SearchMovieVC: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    
    let images = ["movie_pic1", "movie_pic2", "movie_pic3", "movie_pic1", "movie_pic2", "movie_pic3", "movie_pic2", "movie_pic3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        searchView.layer.cornerRadius = 26
        
        if Constants.UIScreen.topSafeArea ?? 0 < 21{
            headerHeightConstraint.constant = 112
        }
    }
    
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension SearchMovieVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
//        self.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        8
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.bgImg.image = UIImage(named: images[indexPath.section])
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-40)/2, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return section == 0 ? UIEdgeInsets(top: 30, left: 15, bottom: 10, right: 15) : UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 15)
    }
    
}
