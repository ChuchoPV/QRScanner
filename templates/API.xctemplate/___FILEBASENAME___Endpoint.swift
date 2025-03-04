// ___FILEHEADER___

import Foundation

enum ___VARIABLE_productName___Endpoint: NetworkTargetType {
        
    var baseURL: String {
        return NetworkAPIConfig.shared.baseURL
    }
    
    var path: String {}
    
    var method: HTTPMethod {}
    
    var sampleData: Data? {
        return nil
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var query: [URLQueryItem] {
        return []
    }
    
    var headers: Headers {
        return [:]
    }
}
