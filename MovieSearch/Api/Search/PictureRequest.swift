import Foundation


struct PictureRequest: RequestProtocol {

    var resource: String
    let method = RequestMethod.get
    
    func getParameters() -> [String : Any] {
        return [:]
    }
}
