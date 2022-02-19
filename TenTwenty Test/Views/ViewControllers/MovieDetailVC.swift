//
//  MovieDetailVC.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 19/02/2022.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    @IBOutlet weak var headerBgView: UIView!
    @IBOutlet weak var getTicketsBtn: UIButton!
    @IBOutlet weak var watchTrailerBtn: UIButton!
    @IBOutlet weak var stackBgView: UIView!
    @IBOutlet weak var genresCollectionView: UICollectionView!
    
    var genres = ["Action", "Thriller", "Science", "Fiction"]
    var bgColors = [Constants.UI.Color.LIGHT_GREEN_COLOR, Constants.UI.Color.LIGHT_PINK_COLOR, Constants.UI.Color.LIGHT_PURPLE_COLOR, Constants.UI.Color.DARK_YELLOW_COLOR]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genresCollectionView.delegate = self
        genresCollectionView.dataSource = self
        genresCollectionView.allowsSelection = false
        
        initialUIConfigurations()
        
    }
    
    func initialUIConfigurations(){
        Utility.setGradientBackground(uiView: headerBgView, colorTop: .gray, colorBottom: .clear, startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 0.5))
        self.getTicketsBtn.layer.cornerRadius = 10
        self.watchTrailerBtn = Utility.designActBtn(uiButton: watchTrailerBtn, borderColor: Constants.UI.Color.LIGHT_BLUE_COLOR)
        Utility.setGradientBackground(uiView: stackBgView)
    }
    
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension MovieDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: genres[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! GenresCollectionViewCell
        cell.label.text = self.genres[indexPath.item]
        cell.backgroundColor = bgColors[indexPath.item]
        return cell
    }
    
}
