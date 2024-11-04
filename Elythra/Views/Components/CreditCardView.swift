import SwiftUI

struct CreditCardView: View {
    
    @Binding var isNumberVisible : Bool
    @Binding var isFlipped : Bool
    @Binding var firstName : String
    @Binding var lastName : String
    
    var body: some View {
        ZStack {
            // Card background with rounded corners and shadow
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 350, height: 200)
                .shadow(radius: 10)
            if(!isFlipped){
                // Card details
                VStack(alignment: .leading) {
                    // Logo
                    HStack {
                        Spacer()
                        Circle()
                            .fill(Color.black.opacity(0.5))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "creditcard").foregroundStyle(.white))
                    }
                    
                    Spacer()
                    
                    // Card Number
                    if(isNumberVisible){
                        Text("1234 5678 9876 5432")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                    }
                    
                    
                    HStack {
                        // Cardholder Name
                        VStack(alignment: .leading) {
                            Text("CARD HOLDER")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                            Text("\(firstName.isEmpty ? "John" : firstName) \(lastName.isEmpty ? "Doe" : lastName)")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        // Expiry Date
                        VStack(alignment: .leading) {
                            Text("EXPIRES")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                            Text("12/24")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(20)
            }
            else{
                VStack {
                    Spacer()
                    HStack{
                        Text("CVC")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                        Text("123")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }.rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
        }
        .frame(width: 350, height: 200)
        .rotation3DEffect(
            .degrees(isFlipped ? 180 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.easeInOut(duration: 0.6), value: isFlipped)
        .onTapGesture {
            isFlipped.toggle()
        }
    }
    
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView(isNumberVisible: .constant(true),isFlipped: .constant(true),firstName: .constant(""), lastName: .constant(""))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
