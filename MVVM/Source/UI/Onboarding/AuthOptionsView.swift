import SwiftUI

struct AuthOptionsView: View {

    @StateObject var viewModel: AuthOptionsViewModel

    var body: some View {
        VStack {
            Spacer()

            Button("Sign In") {
                viewModel.send(.signIn)
            }
            .padding(.bottom)

            Button("Sign Up") {
                viewModel.send(.signUp)
            }

            Spacer()
        }
    }
}

struct AuthOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        AuthOptionsView(viewModel: .init(responder: .noop))
    }
}
