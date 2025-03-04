// ___FILEHEADER___

import Combine

struct ___VARIABLE_productName___API {
    
    let service: NetworkServiceType
    
    static let shared = ___VARIABLE_productName___API()
    
    private init() {
        service = NetworkAPIConfig.shared.networkService
    }
}

extension ___VARIABLE_productName___API: ___VARIABLE_productName___RemoteDataSourceType {}