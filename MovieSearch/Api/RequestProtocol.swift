import Foundation

protocol RequestProtocol {
    associatedtype DataType
    var method: RequestMethod { get }
    var resource: String { get }
    var data: DataType { get }
}
