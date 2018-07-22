import Foundation
import UIKit

class MovieService {
    
    let moviesRestClient: RestClient
    let picturesRestClient: RestClient
    
    
    init() {
        let moviesURL = URL(string: "https://api.themoviedb.org/3/")!
        let picturesURL = URL(string: "https://image.tmdb.org/t/p/w185")!
        let apiKey = "d71fc1ca82e7db37f384ae1d790f07d7"
        
        self.moviesRestClient =  RestClient(baseURL: moviesURL, apiKey: apiKey)
        self.picturesRestClient =  RestClient(baseURL: picturesURL, apiKey: apiKey)
    }
    
    func search(query: String, page: Int, completion: @escaping ([Movie]?) -> Void) {
        
        let request = SearchRequest(query: query, page: page)
        
        moviesRestClient.send(request: request) { (result: RequestResult<SearchResponse>) in
            
            guard result.error == nil && result.response?.statusCode == 200 else {
                self.safeCompletion { completion(nil) }
                return
            }
            
            guard let resultMovieData = result.value else {
                self.safeCompletion { completion([]) }
                return
            }
            
            let movieResponses = resultMovieData.movieResponses
            var movies = [Movie]()
            let downloadGroup = DispatchGroup()
            
            movieResponses.forEach{ _ in downloadGroup.enter() }
            
            for movieResponse in movieResponses {
                
                self.downLoadImage(resource: movieResponse.posterPath) { image in
                    movies.append(Movie(title: movieResponse.originalTitle, overview:  movieResponse.overview, image: image))
                    downloadGroup.leave()
                }
            }
            downloadGroup.notify(queue: DispatchQueue.main) {
                completion(movies)
            }
        }
    }
    
    private func downLoadImage(resource: String?, completion: @escaping (UIImage?)->()) {
        
        guard let posterPath = resource else {
            completion(nil)
            return
        }

        let request = PictureRequest(resource: posterPath)
        
        self.picturesRestClient.send(request: request) { (result: RequestResult<PictureResponse>) in
            
            guard let pictureResponseData = result.value else {
                completion(nil)
                return
            }
            completion(pictureResponseData.image)
        }
    }
    
    private func safeCompletion(completion: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            completion()
        }
    }
}
