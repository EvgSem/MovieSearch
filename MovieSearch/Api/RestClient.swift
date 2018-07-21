import Foundation

class RestClient {
    
    var baseURL: URL
    let defaultSession = URLSession(configuration: .default)
    let apiKey : String
    
    init(baseURL: URL, apiKey: String){
        
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func send<TResponse>(request: RequestProtocol, completion: @escaping (RequestResult<TResponse>) -> Void) where TResponse: ResponseProtocol {
        
        guard var urlComponents = URLComponents(url: self.baseURL, resolvingAgainstBaseURL: false) else {
            
            completion(RequestResult(response: nil, error: nil, value: nil))
            return
        }

        urlComponents.path += request.resource
        
        var parametersQueryString = request.getParameters()
                                           .map({ "\($0)=\($1)" })
                                           .joined(separator: "&")
        
        
        urlComponents.query = "api_key=" + apiKey + "&" + parametersQueryString
        
        guard let url = urlComponents.url else { return }
        
        let dataTask = defaultSession.dataTask(with: url) { data, response, error in
            
            let value: TResponse?
            if let data = data {
                value = TResponse.self.init(data: data)
            } else {
                value = nil
            }
            
            let result = RequestResult(response: response as? HTTPURLResponse,
                                       error: error,
                                       value: value)
            completion(result)
        }
        dataTask.resume()
    }
}
