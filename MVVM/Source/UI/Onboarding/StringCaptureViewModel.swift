import Foundation
import SwiftUI

class StringCaptureViewModel: ObservableObject {

    // MARK: - Lifecycle

    init(responder: Responder<ResponderAction>) {
        self.responder = responder
    }

    // MARK: - Responder

    enum ResponderAction {
        case success(String)
    }

    private let responder: Responder<ResponderAction>

    // MARK: - Input

    enum Action {
        case save(String)
    }

    func send(_ action: Action) {
        switch action {
        case .save(let firstName):
            responder.send(.success(firstName))
        }
    }
}
