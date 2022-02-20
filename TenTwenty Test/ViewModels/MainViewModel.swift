//
//  MainViewModel.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 20/02/2022.
//

import UIKit

class MainViewModel{
    
    static func goToSearchVC(navigationController: UINavigationController?){
        let searchMovieVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchMovieVC") as! SearchMovieVC
        navigationController?.pushViewController(searchMovieVC, animated: true)
    }
    
    static func goToMovieDetailVC(navigationController: UINavigationController?){
        let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
