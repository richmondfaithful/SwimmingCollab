//
//  CurvedSideRectangle.swift
//  swimming
//
//  Created by Vargo Alfonso on 18/05/22.
//

import SwiftUI



struct CustomShape: Shape {
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tl = CGPoint(x: rect.minX, y: rect.minY)
        let tr = CGPoint(x: rect.maxX, y: rect.minY)
        let brs = CGPoint(x: rect.maxX, y: rect.maxY - radius)
        let brc = CGPoint(x: rect.maxX - radius, y: rect.maxY - radius)
        let bls = CGPoint(x: rect.minX + radius, y: rect.maxY)
        let blc = CGPoint(x: rect.minX + radius, y: rect.maxY - radius)
        
        path.move(to: tl)
        path.addLine(to: tr)
        path.addLine(to: brs)
        path.addRelativeArc(center: brc, radius: radius,
                            startAngle: Angle.degrees(0), delta: Angle.degrees(90))
        path.addLine(to: bls)
        path.addRelativeArc(center: blc, radius: radius,
                            startAngle: Angle.degrees(90), delta: Angle.degrees(90))
        return path
    }
    
}

struct CurvedSideRectangle: View {

    
    @State var action: Int? = nil
    @State var customAlert = false
    @StateObject var factListVM = FactListViewModel()
    let array = landmarksData
    
    var body: some View {
        ZStack{
            Text("Easy Level")
                .bold()
                .padding(.bottom,550)
                .font(.title2)
                .foregroundColor(Color.white)
            
            Image("pict")
                .padding(.bottom,680)
                .scaledToFit()
            
            Text("Here's Your Challenge")
                .bold()
                .padding(.bottom,800)
                .font(.title2)
                .foregroundColor(Color.white)
            
            
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Hello World!")
                        .font(.headline)
                        .padding(.top,650)
                        .foregroundColor(.white)
                };
                

        
                ForEach(0..<2,id: \.self){ fact in
                    card()
                        .rotationEffect(.degrees(180))
                        .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
                        .background(Color.white)
                        .padding(.bottom)
                        .padding(.leading, 20)
                }
                
                
                
                
            }
            
            
            .frame(height: 950)
            .background(Color.white)
            .mask(CustomShape(radius: 40))
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
            .edgesIgnoringSafeArea(.all)
            .rotationEffect(.degrees(180))
            .padding(.top, 500)
            
            
            ZStack{
                
                Button(action: {
                    withAnimation{
                        customAlert.toggle()
                    }
                }){
                    Text("Start")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 171, height: 48)
                        .background(Color(red: 0.21, green: 0.33, blue: 0.54))
                        .cornerRadius(20)
                        .padding()
                }.padding(.top,670)
                
                
                if customAlert{
                    AlertView(show: $customAlert)
                }
                
                
            }
            
            
        } .navigationBarBackButtonHidden(true)
        .background(Color(red: 0.21, green: 0.33, blue: 0.54))
        
    }
    
}



struct CurvedSideRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangle()
    }
}

struct BlurView: UIViewRepresentable{
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialLight))
        return view
    }
    
}


struct AlertView: View{
    
    @State var customAlert = false
    @State var change = false
    @Binding var show: Bool
    @State var action: Int? = nil
    @StateObject var factListVM = FactListViewModel()
    
    var body: some View{
        
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            
            VStack(spacing: 20){
                Button(action: {
                    withAnimation{
                        show.toggle()
                    }
                }) {
                    
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 320, height: 10, alignment: .trailing)
                        .foregroundColor(.black)
                }
                
                Image("alert")
                
                Text("Don’t Forget to close your iwatch to safe your iwatch")
                    .font(.title3)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                
                NavigationLink(destination: CountDown(), tag: 1, selection: $action){
                    
                    Button(action: {
                        self.action = 1
                    }){
                        Text("Get Started")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            .background(Color(red: 1.00, green: 0.70, blue: 0.00))
                            .clipShape(Capsule())
                        
                    }
                    
                }
                
                
                
            }
            .padding(.vertical,25)
            .padding(.horizontal,20)
            .background(Color(red: 1.00, green: 0.96, blue: 0.90))
            .cornerRadius(25)
            .padding()
            
            
            
        }
        
    }
    
}
