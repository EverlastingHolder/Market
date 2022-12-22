enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unexpectedStatusCode
    case unknown

    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .invalidURL:
            return "Something wrong with your url"
        case .noResponse:
            return "Empty response"
        default:
            return "Unknown error"
        }
    }
}
