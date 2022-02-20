//
//  ApiManager.swift
//  TenTwenty Test
//
//  Created by Muhammad Abbas on 20/02/2022.
//

import UIKit
import Alamofire

class ApiManager{
    static func getUpcommingMovies(onComplete: @escaping (MoviesData?, String?)->()){
        
        var req = URLRequest(url: URL(string: "\(Constants.ServerConfig.BASE_URL)/movie/upcoming?api_key=\(Constants.ServerConfig.API_KEY)")!)
         req.httpMethod = "POST"
         req.setValue("application/json", forHTTPHeaderField: "Content-Type")
         req.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        AF.request(req).validate().responseJSON { response in
            
            switch (response.result) {
            case .success(_):
                switch response.response?.statusCode{
                case 200:
                    print("Success")
                    do{
                        if let data = response.data{
                            let moviesData = try JSONDecoder().decode(MoviesData.self, from: data)
                            onComplete(moviesData, nil)
                        }
                    }catch{
                        onComplete(nil, "Invalid Model")
                    }
                default:
                    print("Error")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                if error.responseCode == nil{
                    onComplete(nil, "No Internet Connection")
                }else{
                    onComplete(nil, error.localizedDescription)
                }
            }
            
        }
    }
    
    static func getGenresList(onComplete: @escaping (GenresData?, String?)->()){
                
        let headers: HTTPHeaders? = ["Content-Type":"application/json"]
        
        let request = AF.request("\(Constants.ServerConfig.BASE_URL)/genre/movie/list?api_key=\(Constants.ServerConfig.API_KEY)", method: .post, parameters: [:], encoding: JSONEncoding.default, headers: headers)
        request.responseJSON { response in
            
            switch (response.result) {
            case .success(_):
                switch response.response?.statusCode{
                case 200:
                    print("Success")
                    do{
                        if let data = response.data{
                            let genresData = try JSONDecoder().decode(GenresData.self, from: data)
                            onComplete(genresData, nil)
                        }
                    }catch{
                        onComplete(nil, "Invalid Model")
                    }
                    
                default:
                    print("Error")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                if error.responseCode == nil{
                    onComplete(nil, "No Internet Connection")
                }else{
                    onComplete(nil, error.localizedDescription)
                }
            }
            
        }
    }
    
    static func getMovieVideoDetail(movieId: Int, onComplete: @escaping (VideoData?, String?)->()){
                
        let headers: HTTPHeaders? = ["Content-Type":"application/json"]
        
        let request = AF.request("\(Constants.ServerConfig.BASE_URL)/movie/\(movieId)/videos?api_key=\(Constants.ServerConfig.API_KEY)", method: .post, parameters: [:], encoding: JSONEncoding.default, headers: headers)
        request.responseJSON { response in
            
            switch (response.result) {
            case .success(_):
                switch response.response?.statusCode{
                case 200:
                    print("Success")
                    do{
                        if let data = response.data{
                            let videoData = try JSONDecoder().decode(VideoData.self, from: data)
                            onComplete(videoData, nil)
                        }
                    }
                    catch{
                        onComplete(nil, "Invalid Model")
                    }
                default:
                    print("Error")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                if error.responseCode == nil{
                    onComplete(nil, "No Internet Connection")
                }else{
                    onComplete(nil, error.localizedDescription)
                }
            }
            
        }
    }
    
}
