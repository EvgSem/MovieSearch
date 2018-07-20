import Foundation

protocol ResponseProtocol {
    
    var status: HTTPURLResponse { get }
    
    init?(data: Data, status: HTTPURLResponse)
}
