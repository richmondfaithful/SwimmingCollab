//
//  ButtonSpin.swift
//  swimming
//
//  Created by Vargo Alfonso on 19/05/22.
//

import SwiftUI

struct ButtonSpin: View {
    @State private var degrees = 0.0
    //    @Binding var movetoWorkout: Bool
    ////    @Binding var isloading: Bool
    @State var action: Int? = nil
    //    var d = false
    //    @Binding d: CGFloat = dou
    
    
    var body: some View {
        VStack{
            
            Text("Tap to Find Out !!")
                .font(.largeTitle)
                .kerning(1.0)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.21, green: 0.33, blue: 0.54))
                .padding(.bottom,100)
            
            Image("boarding")
                .resizable()
                .frame(width: 250.0, height: 250.0)
                .rotationEffect(.degrees(degrees))
                .padding(.bottom,50)
            
            //            Button("Spin") {
            //                let d = Double.random(in: 720...10000)
            //                let baseAnimation =
            //                    Animation.easeInOut(duration: d / 360)
            //                withAnimation (baseAnimation) {
            //                    self.degrees += d
            //
            //                }
            //            }
            
            
            //            Button(action: {
            //                var d = Double.random(in: 720...10000)
            //                let baseAnimation =
            //                    Animation.easeInOut(duration: d / 360)
            //                withAnimation (baseAnimation) {
            //                    self.degrees += d
            //                }
            
            
            
            NavigationLink(destination: CurvedSideRectangle(), tag: 1, selection: $action){
                
                Button(action: {
                    let d = Double.random(in: 720...10000)
                    let baseAnimation =
                    Animation.easeInOut(duration: 10)
                    withAnimation (baseAnimation) {
                        self.degrees += d
                    }
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 9){
                        self.action = 1
                    }
                }){
                    Text("Get Started")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .background(Color(red: 0.21, green: 0.33, blue: 0.54))
                        .cornerRadius(2.0)
                }.padding(.bottom,90)
                
                //
            }
            
            //                NavigationLink(destination: ContentView(), tag: 1, selection: $action){
            //                Button(action: {
            //                    let d = Double.random(in: 720...10000)
            //                    let baseAnimation =
            //                        Animation.easeInOut(duration: d / 360)
            //                    withAnimation (baseAnimation) {
            //                        self.degrees += d
            //                    }
            //
            //
            //                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            //                        self.action = 1
            //                    }
            //
            //                }
            //
            //
            //            }){
            //                Text("Tap")
            //                    .foregroundColor(.white)
            //                    .fontWeight(.bold)
            //                    .frame(width: 200, height: 50)
            //                    .background(Color(red: 0.21, green: 0.33, blue: 0.54))
            //                    .cornerRadius(2.0)
            //                    .padding(.bottom,30)
            //            }.padding(.top,90)
            
            
        }
    }
}

struct ButtonSpin_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSpin()
    }
}
