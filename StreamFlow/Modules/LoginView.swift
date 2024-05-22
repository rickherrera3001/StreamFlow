import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var contraseña: String = ""
    
    var body: some View {
        
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255).ignoresSafeArea()
            
            VStack {
                Image("App Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110)
                    .padding(.bottom, 60.0)
                    .padding(.top, 50) 
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
                    
                    ZStack(alignment: .leading) {
                        if email.isEmpty {
                            Text("ejemplo@gmail.com")
                                .font(.caption)
                                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        }
                        
                        TextField("", text: $email)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(5.0)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

