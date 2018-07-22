import Foundation
import UIKit


struct PictureResponse: ResponseProtocol {
    
    let image: UIImage

    init?(data: Data) {
        guard let image = UIImage(data: data) else {
            return nil
        }
        self.image = image
    }
}
