//
//  onboarding.swift
//  swimming
//
//  Created by PUTRI RAHMADEWI on 21/05/22.
//

import SwiftUI

struct onboarding: View {
    @State var show: Bool = true
    var body: some View {
        NavigationView{
            VStack{
                boarding()
            }
        }
    }
}

struct boarding: View{
    var body: some View {
        TabView{
            Page()
                .background(Color.white)
            Page2(button: true)
            
                .background(Color.white)
        }
        .tabViewStyle(PageTabViewStyle())
        
    }
}

struct Page2: View{
    @State var action: Int? = nil
    let button: Bool
    
    var body: some View{
            ZStack{
                VStack(){
                    Image("applewatch")
                     .resizable()
                     .frame(width: 250, height: 250)
                     .padding(.init(40))
                     
                    
                    Text("Connect to your Apple Watch")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top)
                        
                    Text("Connect your Apple Watch to track your swimming duration and distance with your own choices.")
                        .font(.callout)
                        .fontWeight(.light)
                        .kerning(0.2)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding()
                        Spacer()
                   
                    
                    NavigationLink(destination: ContentView(), tag: 1, selection: $action){
                        
                        Button(action: {
                            self.action = 1
                        }){
                            Text("Get Started")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 200, height: 50)
                                .background(Color(red: 0.21, green: 0.33, blue: 0.54))
                                .cornerRadius(2.0)
                        }.padding(.bottom,90)
                        
//                        if button{
//                            Button(action: {
//
//                            }, label: {
//                                Text("Get Started")
//                                    .foregroundColor(.white)
//                                    .fontWeight(.bold)
//                                    .frame(width: 200, height: 50)
//                                    .background(Color(red: 0.21, green: 0.33, blue: 0.54))
//                                    .cornerRadius(2.0)
//                            })
//                        }
                    }
                }
            }
        }
}

struct Page: View{
    @State private var spin = false
    
    var body: some View{
        VStack{
            
            Image("orang")
                .scaledToFit()
                .padding(.top,270)
                .frame(width: 330, height: 10)
            
            Image("putar")
                .resizable()
                .frame(width: 180.0, height: 180.0)
                .padding(.init(70))
                .rotationEffect(.degrees(spin ? 360:0))
                .animation(.linear(duration: 6).repeatForever(autoreverses: false), value: spin)
                .onAppear(){
                    self.spin.toggle()
                }
            
            Text("Welcome To SwimDOME!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            Text("Challenging you with a randomize swimming style with only one tap away! ")
                .font(.callout)
                .fontWeight(.light)
                .kerning(0.2)
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .padding(.top)
                .padding()
            Spacer()
        }
    }
}

struct onboarding_Previews: PreviewProvider {
    static var previews: some View {
        onboarding()
    }
}
