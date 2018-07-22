import Foundation

final class MovieSearchViewModel {
    
    func createMovieSearchResultViewModel(query: String) -> MovieSearchResultViewModel {
        
        let url = URL(string: "https://api.themoviedb.org/3/")!
        let apiKey = "d71fc1ca82e7db37f384ae1d790f07d7"
        
        let movieService = MovieService(restClient: RestClient(baseURL: url, apiKey: apiKey))
        return MovieSearchResultViewModel(query: query, movieService: movieService)
    }
    
    
}
