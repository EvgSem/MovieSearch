import Foundation

class MovieService {
    
    let restClient: RestClient
    
    init(restClient: RestClient) {
        self.restClient = restClient
    }
    
    func search(query: String, page: Int, completion: @escaping ([Movie]?) -> Void) {
        
        let request = SearchRequest(query: query, page: page)
        
        restClient.send(request: request) { (result: RequestResult<SearchResponse>) in
            
            guard result.error != nil || result.response?.statusCode == 200 else {
                self.safeCompletion { completion(nil) }
                return
            }
            
            guard let resultMovieData = result.value else {
                self.safeCompletion { completion([]) }
                return
            }
            
            let movieResponses = resultMovieData.movieResponses
            var movies = [Movie]()
            
            for movieResponse in movieResponses {
                movies.append(Movie(title: movieResponse.originalTitle, overview:  movieResponse.overview))
            }
                
            self.safeCompletion { completion(movies) }
        }
    }
    
    private func safeCompletion(completion: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            completion()
        }
    }
}
