//
//  CountDown.swift
//  swimming
//
//  Created by PUTRI RAHMADEWI on 21/05/22.
//


import SwiftUI

struct CountDown: View{
    @State var minutes = 60
        
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @ObservedObject var stopWatchManager = StopWatchManager()
    @State var action: Int? = nil
    
    var body: some View{
        
            ZStack{
                Color(red: 0.21, green: 0.33, blue: 0.54)
                    .ignoresSafeArea()
                VStack(){
                    NavigationLink(destination: Congrats(), tag: 1, selection: $action){
                    Text("\(timeString(time: TimeInterval(minutes) ))")
                        .font(.custom("Avenir", size: 80))
                        .foregroundColor(Color.white)
                        .padding(.top, 200)
                        .padding(.bottom, 100)
                        .background(CountDown.alert())
                        .onReceive(timer){ _ in
                          
                                        if self.minutes > 0 {
                                            self.minutes -= 1
                                        }else{
                                            self.action = 1
                                            self.timer.upstream.connect().cancel()
                                        }
                          

                } .padding(.bottom,300)
                    }
            }
        } .navigationBarBackButtonHidden(true)
        
    }

func timeString(time: TimeInterval) -> String {
//       let hours   = Int(time) / 3600
       let minutes = Int(time) / 60 % 60
       let seconds = Int(time) % 60
       return String(format:"%02i:%02i", minutes, seconds)
   }


struct alert: View{
    var body: some View{
        VStack{
            Image("Oval")
                .resizable()
                .scaledToFit()
                .frame(width: 287, height: 287)
                .padding(.top,110)
        }
    }
}



struct CountDown_previews: PreviewProvider{
    static var previews: some View{
        CountDown()
        
    }
}

struct TimerButton: View{
    let label: String
    let buttonColor: Color
    let textColor: Color
    
    var body: some View{
        Text(label)
            .bold()
            .foregroundColor(textColor)
            .font(.largeTitle)
            .padding(.vertical, 20)
            .padding(.horizontal, 90)
            .background(buttonColor)
            .cornerRadius(20)
    }
    
}




}
