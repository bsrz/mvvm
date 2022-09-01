@testable import MVVM
import XCTest

class OnboardingViewModelTests: XCTestCase {
    func testViewModel_givenFullOnboardingFlow_capturesValuesAsExpected() {
        var expectedFirstName = ""
        var expectedLastName = ""
        var expectedEmail = ""
        var expectedPassword = ""

        let sut = OnboardingViewModel(
            responder: .init { action in
                switch action {
                case let .success(outputFirstName, outputLastName, outputEmail, outputPassword):
                    expectedFirstName = outputFirstName
                    expectedLastName = outputLastName
                    expectedEmail = outputEmail
                    expectedPassword = outputPassword

                case .back:
                    break
                }
            }
        )

        let sub = sut.$state.sink { state in
            switch state {
            case .firstName(let viewModel):
                viewModel.send(.save("first"))

            case .lastName(let viewModel):
                viewModel.send(.save("last"))

            case .email(let viewModel):
                viewModel.send(.save("email"))

            case .password(let viewModel):
                viewModel.send(.save("password"))

            case .idle:
                break
            }
        }

        sut.send(.onAppear)

        XCTAssertEqual(expectedFirstName, "first")
        XCTAssertEqual(expectedLastName, "last")
        XCTAssertEqual(expectedEmail, "email")
        XCTAssertEqual(expectedPassword, "password")

        sub.cancel()
    }
}
