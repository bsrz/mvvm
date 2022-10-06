import Foundation
import SwiftUI

@MainActor
class SettingsViewModel: ObservableObject, Identifiable {

    // MARK: - Properties

    nonisolated
    var id: String { .init(describing: Self.self) }

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
            responder.send(.logout)
        }
    }
}
