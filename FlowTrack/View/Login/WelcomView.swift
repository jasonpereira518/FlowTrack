//
//  WelcomView.swift
//  FlowTrack
//
//  Created by Jason Pereira on 11/5/24.
//

import SwiftUI

struct WelcomView: View {
    @State var showSignIn: Bool = false
    @State var showSignUp: Bool = false
    
    var body: some View {
        ZStack {
            Image("welcome_screen")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .widthPer(per: 0.5))
                    .padding(.top, .topInsets + 8)
                Text("by Jason\n\nKeep the cash flow on track.")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.regular, fontSize: 14))
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                Spacer()
                Text("Welcome to FlowTrack!\nSign in to continue.")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.regular, fontSize: 14))
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                PrimaryButton(title: "Get Started", onPressed: {
                    showSignUp.toggle()
                })
                .background( NavigationLink(destination: SocialSignupView(), isActive: $showSignUp, label: {
                    EmptyView()
                }) )
                .padding(.bottom, 15)
                
                SecondaryButton(title: "I have an account", onPressed: {
                    showSignIn.toggle()
                })
                .background( NavigationLink(destination: SignInView(), isActive: $showSignIn, label: {
                    EmptyView()
                }) )
                .padding(.bottom, .bottomInsets)
                
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct WelcomView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
    }
}
