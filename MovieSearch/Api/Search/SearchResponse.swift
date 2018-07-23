import Foundation

struct SearchResponse: ResponseProtocol {
    
    let movieResponses: [MovieResponse]
    let page: Int
    let totalResults: Int
    let totalPages: Int

    init?(data: Data) {
        
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
        
        guard let dictionary = jsonObject as? [String: Any] else {
            return nil
        }
        
        var parsedMovies = [MovieResponse]()
        guard let page = dictionary["page"] as? Int,
            let totalPages = dictionary["total_results"] as? Int,
            let totalResults = dictionary["total_pages"] as? Int else {
          return nil
        }
        
        self.page = page
        self.totalPages = totalPages
        self.totalResults = totalResults
        
        
        guard let movies = dictionary["results"] as? [Any] else {
            return nil
        }
        
        for movieJson in movies {
            
            guard let movieJson = movieJson as? [String: Any] else {
                continue
            }
            
            let posterPath = movieJson["poster_path"]  as? String
            let overview = movieJson["overview"]  as! String
            let releaseDate = movieJson["release_date"]  as! String
            let originalTitle = movieJson["original_title"]  as! String
            let originalLang = movieJson["original_language"]  as! String
            let title = movieJson["title"]  as! String
            
            let movieResponse = MovieResponse(posterPath: posterPath,
                                              overview: overview,
                                              releaseDate: releaseDate,
                                              originalTitle: originalTitle,
                                              originalLang: originalLang,
                                              title: title)
            
            parsedMovies.append(movieResponse)
        }
        
        self.movieResponses = parsedMovies
    }
    
    typealias DataType = Int
}
