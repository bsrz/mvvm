@testable import MVVM
import XCTest

@MainActor
class AuthViewModelTests: XCTestCase {
    func testViewModel_givenValidCredentials_respondsWithSuccess() {
        var expected = false

        let sut = AuthViewModel(
            responder: .init { action in
                expected = action == .success
            }
        )

        sut.send(.authenticate("username", "password"))

        XCTAssertTrue(expected)
    }
}
