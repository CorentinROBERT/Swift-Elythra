import SwiftUI
import Combine

struct ImageCarousel: View {
    
    @State private var isAutoPlay: Bool = true
    @State private var selection = 0
    @State private var timerCancellable: Cancellable? = nil
    var images: [(imagePath: String, text: String)] = [
        ("digital_banking", "carousel_fourth".localize()),
        ("data_security", "carousel_first".localize()),
        ("forex", "carousel_second".localize()),
        ("banking_card", "carousel_third".localize()),
        ("create_value", "carousel_fifth".localize())
    ]
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                ForEach(0..<images.count, id: \.self) { index in
                    GeometryReader { geometry in
                        ZStack(alignment: .bottom) {
                            Image("\(images[index].imagePath)")
                                .resizable()
                                .scaledToFill()
                                .frame(minHeight: (geometry.size.height / 4) * 3.5, maxHeight: (geometry.size.height / 4) * 3.5)
                                .clipped()
                            Text(images[index].text)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .padding(.horizontal, 30)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: geometry.size.width)
                                .padding()
                                .background(Color.black.opacity(0.5))
                        }
                        .frame(width: geometry.size.width, height: (geometry.size.height / 4) * 3.5)
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    private func startTimer() {
        if isAutoPlay {
            timerCancellable = Timer.publish(every: 5, on: .main, in: .common)
                .autoconnect()
                .sink { _ in
                    withAnimation {
                        selection = (selection + 1) % images.count
                    }
                }
        }
    }
    
    private func stopTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }
}

#Preview {
    ImageCarousel()
}
