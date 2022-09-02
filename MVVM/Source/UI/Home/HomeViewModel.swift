import Foundation

class HomeViewModel: ObservableObject {

    // MARK: - Lifecycle

    init(responder: Responder<ResponderAction>) {
        self.responder = responder
    }

    // MARK: - Responder

    enum ResponderAction {
        case logout
    }

    private let responder: Responder<ResponderAction>

    // MARK: - Input

    enum Action {
        case logout
    }

    func send(_ action: Action) {
        switch action {
        case .logout:
            // 1. tell parent
            responder.send(.logout)
        }
    }
}
