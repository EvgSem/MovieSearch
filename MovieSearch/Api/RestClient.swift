import Foundation

class RestClient {
    
    var baseURL: URL
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    
    init(baseURL: URL){
        
        self.baseURL = baseURL
    }
    
    func send<T>(request: T, completion: (ResponseProtocol) -> Void) where T:RequestProtocol {
        
        dataTask?.cancel()
        
        if  var urlComponents = URLComponents(string: baseURL.absoluteString + request.resource) {
            
            urlComponents.query = "api_key=d71fc1ca82e7db37f384ae1d790f07d7&language=en-US&query=Lion%20King&page=1&include_adult=false"
            
            guard let url = urlComponents.url else { return }
            
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                
                
                if let error = error {
                    
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else {
                    
                    if let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                        
                        print(data)
                        
                    }
                }
            }
        }
    }
}
