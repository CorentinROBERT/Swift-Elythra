import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    var viewModel = OnBoardingViewModel()
    @State var currentView: AnyView = AnyView(EmptyView())

    var body: some View {
        NavigationStack {
            VStack {
                ProgressView(value: viewModel.progress, total: 1)
                    .tint(.black)
                    .background(.black.opacity(0.3))
                currentView
            }
            Spacer()
            HStack {
                Spacer()
                Button("previous".localize()) {
                    currentView = viewModel.previous()
                }.disabled(viewModel.step == .start)
                Spacer()
                Button("next".localize()) {
                    currentView = viewModel.next()
                }
                .disabled(viewModel.step == .agreeToTerms)
                Spacer()
            }
            .padding()
            .navigationTitle("onboarding".localize())
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

        }
        .background(.white)
        .onAppear {
            currentView = resumeCurrentStep()
        }
    }
    
    func resumeCurrentStep() -> AnyView {
        viewModel.currentStep()
    }
}

#Preview {
    OnboardingView()
}
