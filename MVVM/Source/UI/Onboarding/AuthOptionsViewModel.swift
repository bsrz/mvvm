import Foundation

@MainActor
class AuthOptionsViewModel: ObservableObject {

    // MARK: - Lifecycle

    init(responder: Responder<ResponderAction>) {
        self.responder = responder
    }

    // MARK: - Responder

    enum ResponderAction {
        case signIn
        case signUp
    }

    private let responder: Responder<ResponderAction>

    // MARK: - Input

    enum Action {
        case signIn
        case signUp
    }

    func send(_ action: Action) {
        switch action {
        case .signIn:
            responder.send(.signIn)

        case .signUp:
            responder.send(.signUp)
        }
    }
}
