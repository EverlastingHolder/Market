import Foundation

class MainEndpoints: Endpoint {
    var baseURL: String {
        "https://"
    }
    
    var path: String {
        "run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var header: [String : String]?
    
    var body: [String : String]?
}
