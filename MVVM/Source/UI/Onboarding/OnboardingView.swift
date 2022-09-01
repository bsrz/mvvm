import SwiftUI

struct OnboardingView: View {

    @StateObject var viewModel: OnboardingViewModel

    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                Text("Idle")

            case .firstName(let viewModel):
                VStack {
                    StringCaptureView(
                        textPlaceholder: "First Name",
                        buttonTitle: "Next",
                        viewModel: viewModel
                    )

                    Button("Back") {
                        self.viewModel.send(.back)
                    }
                }

            case .lastName(let viewModel):
                StringCaptureView(
                    textPlaceholder: "Last Name",
                    buttonTitle: "Next",
                    viewModel: viewModel
                )

            case .email(let viewModel):
                StringCaptureView(
                    textPlaceholder: "Email",
                    buttonTitle: "Next",
                    viewModel: viewModel
                )

            case .password(let viewModel):
                StringCaptureView(
                    textPlaceholder: "Password",
                    buttonTitle: "Done",
                    viewModel: viewModel
                )
            }
        }
        .onAppear {
            viewModel.send(.onAppear)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: .init(responder: .noop))
    }
}
