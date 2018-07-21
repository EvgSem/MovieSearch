import Foundation

class MovieService {
    
    let restClient: RestClient
    
    init(restClient: RestClient) {
        self.restClient = restClient
    }
    
    func search(query: String, page: Int, completion: @escaping (SearchResponse?) -> Void) {
        
        let request = SearchRequest(query: query, page: page)
        
        restClient.send(request: request) { (result: RequestResult<SearchResponse>) in
            completion(result.value)
        }
    }
}
