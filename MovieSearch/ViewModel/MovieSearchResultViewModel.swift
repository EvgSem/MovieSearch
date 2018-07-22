import Foundation

final class MovieSearchResultViewModel {
    
    private let query: String
    private let movieService: MovieService
    private var currentPage = 1
    
    var movies: [Movie] = []
    
    init(query: String, movieService: MovieService) {
        
        self.query = query
        self.movieService = movieService
    }
    
    func queryNextMoviesBatch(completion: @escaping (Bool) -> Void) {
        
        self.movieService.search(query: self.query, page: self.currentPage) { movies in
            
            guard let movies = movies else {
                
                completion(false)
                return
            }
            
            movies.forEach { self.movies.append($0) }
            self.currentPage += 1
            completion(true)
        }
    }
}
