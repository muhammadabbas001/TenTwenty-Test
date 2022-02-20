//
//  MovieDetailVM.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 20/02/2022.
//

import UIKit

class MovieDetailVM{
    
    static func getMovieVideoDetail(movieId: Int, onComplete: @escaping (MoviesData?, String?)->()){
        ApiManager.getMovieVideoDetail(movieId: movieId) { videoData, error in
            if let _ = error {
                print("Error")
            }else{
                print("Success")
            }
        }
    }
    
}
