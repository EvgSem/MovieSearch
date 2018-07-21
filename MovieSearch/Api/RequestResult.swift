import Foundation

struct RequestResult<T> where T: ResponseProtocol {
    
    let response: HTTPURLResponse?
    
    let error: Error?
    
    let value: T?
}
