import Foundation

protocol RequestProtocol {
    
    var method: RequestMethod { get }
    var resource: String { get }
    
    func getParameters() -> [String: Any]
}
