//
//  Congrats.swift
//  PopupPutri
//
//  Created by PUTRI RAHMADEWI on 17/05/22.
//

import SwiftUI

struct Congrats: View{
    var body: some View{
            VStack(){
                Text("Congratulation!")
                    .font(.largeTitle)
                    .kerning(3.5)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.21, green: 0.33, blue: 0.54))
                    .padding(.bottom,50)

                Image("congrats")
                 .resizable()
                 .scaledToFit()
                 .frame(width: 300, height:303)

                
            
                Text("Tap it to see the result of swimming recommendation that suits you")
                    .font(.callout)
                    .fontWeight(.light)
                    .kerning(0.2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .padding()
               
                    VStack {
                        NavigationLink{
                            ContentView()
                        }label: {
                            Text("Thank You")
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 200, height: 40)
                        .background(Color(red: 0.21, green: 0.33, blue: 0.54))
                        .cornerRadius(10)
                        .padding(.bottom,90)}
                    
                        } .navigationBarBackButtonHidden(true).background(.white)
                        
        }
        
            }

struct Congrats_previews: PreviewProvider{
    static var previews: some View{
        Congrats()
           
    }
}

