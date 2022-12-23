struct CartEndpoint: Endpoint {
    var baseURL: String {
        "https://"
    }
    
    var path: String {
        "run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var header: [String : String]?
    
    var body: [String : String]?
}
