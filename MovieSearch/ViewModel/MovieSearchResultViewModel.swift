import Foundation

final class MovieSearchResultViewModel {
    
    private let query: String
    private let movieService: MovieService
    private var currentPage = 1
    private var totalPages: Int
    private var isRequestRunning: Bool = false
    
    var movies: [Movie] = []
    
    init(query: String, movieService: MovieService) {
        
        self.query = query
        self.movieService = movieService
        self.totalPages = 0
    }
    
    func queryNextMoviesBatch(completion: @escaping (Bool) -> Void) {
        
        guard !self.isRequestRunning else {
            completion(false)
            return
        }
        
        self.isRequestRunning = true
        
        self.movieService.search(query: self.query, page: self.currentPage) { movies, totalPages in
            self.isRequestRunning = false
            guard let movies = movies else {
                
                completion(false)
                return
            }
            
            movies.forEach { self.movies.append($0) }
            self.currentPage += 1
            self.totalPages = totalPages
            completion(true)
        }
    }
    
    func moreMoviesAvavilable() -> Bool {
        return self.currentPage <= self.totalPages
    }
}
