import SwiftUI

struct CarouselEndpoints: Endpoint {
    var baseURL: String {
        "https://"
    }
    
    var path: String {
        "run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var header: [String : String]?
    
    var body: [String : String]?
       
}
