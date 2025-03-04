// ___FILEHEADER___

import Foundation
import Combine

class ___VARIABLE_productName___ViewModel: ObservableObject, ___VARIABLE_productName___ViewModelType {

    // MARK: Properties
    @Published var isLoading = false

    // MARK: Private
    var cancellables: [AnyCancellable] = []
    let dependencies: ___VARIABLE_productName___Dependencies

    init(dependencies: ___VARIABLE_productName___Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: Inputs
extension ___VARIABLE_productName___ViewModel {}
