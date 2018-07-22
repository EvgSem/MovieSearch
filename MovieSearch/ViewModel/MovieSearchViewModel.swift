import Foundation

final class MovieSearchViewModel {
    
    func createMovieSearchResultViewModel(query: String) -> MovieSearchResultViewModel {

        return MovieSearchResultViewModel(query: query, movieService: MovieService())
    }
    
    
}
