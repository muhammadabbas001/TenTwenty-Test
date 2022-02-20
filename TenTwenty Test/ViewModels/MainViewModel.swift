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
    
    static func goToMovieDetailVC(navigationController: UINavigationController?, bgImg: String, releaseData: String, overview: String){
        let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        movieDetailVC.bgImageStr = bgImg
        movieDetailVC.releaseDate = "In theaters " + formatDate(dateStr: releaseData)
        movieDetailVC.overview = overview
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    static func getUpcomingMovies(onComplete: @escaping (MoviesData?, String?)->()){
        ApiManager.getUpcommingMovies { moviesData, error in
            if let error = error {
                onComplete(nil, error.localizedLowercase)
            }else{
                onComplete(moviesData, nil)
            }
        }
    }
    
    static func getGenresList(onComplete: @escaping (MoviesData?, String?)->()){
        ApiManager.getGenresList { genresData, error in
            if let error = error {
                print("Error")
            }else{
                print(genresData)
            }
        }
    }
    
    static func formatDate(dateStr: String) -> String{
        
        //"2022-03-10" to "March 10,2022"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateStr)
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: date!)
    }
}
