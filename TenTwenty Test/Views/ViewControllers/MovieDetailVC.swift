//
//  MovieDetailVC.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 19/02/2022.
//

import UIKit
import SDWebImage
import youtube_ios_player_helper

class MovieDetailVC: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var headerBgView: UIView!
    @IBOutlet weak var getTicketsBtn: UIButton!
    @IBOutlet weak var watchTrailerBtn: UIButton!
    @IBOutlet weak var stackBgView: UIView!
    @IBOutlet weak var genresCollectionView: UICollectionView!
    @IBOutlet weak var scrollViewConstraintTop: NSLayoutConstraint!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var releaseDataLbl: UILabel!
    @IBOutlet weak var overviewLbl: UITextView!
    @IBOutlet weak var spinnerView: UIView!
    @IBOutlet weak var spinnerIndicator: UIActivityIndicatorView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    
    var bgImageStr = ""
    var releaseDate = ""
    var overview = ""
    
    var genres = ["Action", "Thriller", "Science", "Fiction"]
    var bgColors = [Constants.UI.Color.LIGHT_GREEN_COLOR, Constants.UI.Color.LIGHT_PINK_COLOR, Constants.UI.Color.LIGHT_PURPLE_COLOR, Constants.UI.Color.DARK_YELLOW_COLOR]
    
    let videoPlayer = YTPlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genresCollectionView.delegate = self
        genresCollectionView.dataSource = self
        genresCollectionView.allowsSelection = false
        
        videoPlayer.delegate = self
        
        initialUIConfigurations()
        
        if Constants.UIScreen.topSafeArea ?? 0 < 21{
            headerHeightConstraint.constant = 140
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerExited), name: UIWindow.didBecomeHiddenNotification, object: nil)
    }
    
    func initialUIConfigurations(){
        Utility.setGradientBackground(uiView: headerBgView, colorTop: .gray, colorBottom: .clear, startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 0.5))
        self.getTicketsBtn.layer.cornerRadius = 10
        self.watchTrailerBtn = Utility.designActBtn(uiButton: watchTrailerBtn, borderColor: Constants.UI.Color.LIGHT_BLUE_COLOR)
        Utility.setGradientBackground(uiView: stackBgView)
        self.view.insetsLayoutMarginsFromSafeArea = false
        
        bgImage.sd_setImage(with: URL(string: "\(Constants.ServerConfig.IMAGE_BASE_URL)\(bgImageStr)"), placeholderImage: UIImage(named: "placeholder.png"))
        releaseDataLbl.text = releaseDate
        overviewLbl.text = overview
        
        spinnerViewUI()
                
        if let topSafeArea = Constants.UIScreen.topSafeArea{
            self.scrollViewConstraintTop.constant = self.scrollViewConstraintTop.constant - topSafeArea
        }
    }
    
    func spinnerViewUI(){
        self.spinnerView.layer.cornerRadius = 15
        self.spinnerView.layer.borderColor = Constants.UI.Color.DARK_YELLOW_COLOR.cgColor
        self.spinnerView.layer.borderWidth = 4
    }
    
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actWatchTrailer(_ sender: Any) {
        showSpinner()
        videoPlayer.load(withVideoId: "ta5dr6QxQn0", playerVars: ["playsinline": 0])
        self.view.addSubview(videoPlayer)
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        videoPlayer.playVideo()
        hideSpinner()
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        if state == .ended{
            self.videoPlayer.removeFromSuperview()
        }
    }
    
    @objc func playerExited(){
        self.videoPlayer.removeFromSuperview()
    }
    
    func showSpinner(){
        self.spinnerView.isHidden = false
        self.spinnerIndicator.startAnimating()
    }
    
    func hideSpinner(){
        self.spinnerView.isHidden = true
        self.spinnerIndicator.stopAnimating()
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
