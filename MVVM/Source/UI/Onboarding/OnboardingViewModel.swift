import Foundation
import SwiftUI

@MainActor
class OnboardingViewModel: ObservableObject {

    // MARK: - Properties

    private var firstName = ""
    private var lastName = ""
    private var password = ""
    private var email = ""

    // MARK: - Lifecycle

    init(responder: Responder<ResponderAction>) {
        self.responder = responder
    }

    // MARK: - Responder

    enum ResponderAction {
        case back
        case success(String, String, String, String)
    }

    private let responder: Responder<ResponderAction>

    // MARK: - Input

    enum Action {
        case onAppear
        case back
        case nextFirstName
        case nextLastName
        case nextEmail
        case nextPassword
    }

    func send(_ action: Action) {
        switch action {
        case .onAppear:
            send(.nextFirstName)

        case .back:
            responder.send(.back)

        case .nextFirstName:
            set(state: .firstName(
                StringCaptureViewModel(
                    responder: .init { action in
                        switch action {
                        case .success(let firstName):
                            self.firstName = firstName
                            self.send(.nextLastName)
                        }
                    }
                )
            ))

        case .nextLastName:
            set(state: .lastName(
                StringCaptureViewModel(
                    responder: .init { action in
                        switch action {
                        case .success(let lastName):
                            self.lastName = lastName
                            self.send(.nextEmail)
                        }
                    }
                )
            ))

        case .nextEmail:
            set(state: .email(
                StringCaptureViewModel(
                    responder: .init { action in
                        switch action {
                        case .success(let email):
                            self.email = email
                            self.send(.nextPassword)
                        }
                    }
                )
            ))

        case .nextPassword:
            set(state: .password(
                StringCaptureViewModel(
                    responder: .init { action in
                        switch action {
                        case .success(let password):
                            self.password = password
                            self.responder.send(.success(self.firstName, self.lastName, self.email, self.password))
                        }
                    }
                )
            ))
        }
    }

    // MARK: - Output

    enum State {
        case idle
        case firstName(StringCaptureViewModel)
        case lastName(StringCaptureViewModel)
        case email(StringCaptureViewModel)
        case password(StringCaptureViewModel)
    }

    @Published private(set) var state: State = .idle

    // MARK: - Private / Support

    private func set(state: State) {
        withAnimation { self.state = state }
    }
}
