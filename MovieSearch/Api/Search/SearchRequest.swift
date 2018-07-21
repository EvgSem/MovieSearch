import Foundation

struct SearchRequest: RequestProtocol {
    
    let resource = "search/movie"
    let method = RequestMethod.get
    
    let query: String
    let page: Int
    
    func getParameters() -> [String: Any] {
        
        return ["query" : self.query,
                "page" : self.page]
    }
}
