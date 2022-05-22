//
//  ContentView.swift
//  Happy Facts
//
//  Created by Stewart Lynch on 2021-05-18.
//

import SwiftUI
import CollectionViewPagingLayout

struct ContentView: View {
    @StateObject var factListVM = FactListViewModel()
    @State var action: Int? = nil
    @State var loading = false
    @State var moveToWorkout = false
    @State private var showSecondView = false
    @State var jump = false
    
    var options: ScaleTransformViewOptions{
        .layout(.linear)
    }
    
    var body: some View {
        VStack{
            Text("Choose Your Swimming Level!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text("We appreciate what you like, to make us closer, let me know about wanting you to do")
                .font(.callout)
                .fontWeight(.light)
                .kerning(0.2)
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .padding()
            
            
            ScalePageView(factListVM.facts, selection: $factListVM.selectedFactId){ fact in
                Image(fact.imageName)
                    .scaledToFit()
                    .frame(width: 210, height: 230)
                    .font(.callout)
                    .padding(.top,40)
                    .foregroundColor(.white)
                
//                                if loading{
//                                    Spin(movetoWorkout: $moveToWorkout, isloading: $loading)
//                                }else{
//                                    NavigationLink{
//                                        if fact.imageName == "easy3"{
//                                            CurvedSideRectangle()
//                                        }
//                                        if fact.imageName == "medium"{
//                                            onboarding()
//                                        }
//                                        if fact.imageName == "advance"{
//                                            onboarding()
//                                        }
//
//                                    }label: {
//
//                                        Text("Choose Level")
//                                            .font(.system(size: 16, weight: .bold, design: .rounded))
//                                            .foregroundColor(Color.white)
//                                    }
//                                    .frame(width: 180, height: 50)
//                                    .padding()
//                                    .background(Color(red: 0.21, green: 0.33, blue: 0.54))
//                                    .cornerRadius(20)
//                                    .padding()
//
//                                    .onTapGesture {
//                                        loading.toggle()
//                                    }
//                                }
//
//                NavigationLink(isActive: $moveToWorkout){
//                    CurvedSideRectangle(listfact: $factListVM)
//
//                                } label: {
//                                    EmptyView()
//                                } .navigationTitle("tEST")
                NavigationLink{
                    if fact.imageName == "easy3" {
                        CurvedSideRectangle()
                    }
                    if fact.imageName == "medium"{
                        medium()
                    }
                    if fact.imageName == "advance"{
                        advanced()
                    }

                }label: {

                    Text("Choose Level")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                }
                .frame(width: 180, height: 50)
                .padding()
                .background(Color(red: 0.21, green: 0.33, blue: 0.54))
                .cornerRadius(20)
                .padding()
                
            }
            //                            .background(Color.black.opacity(0.8))
            //                            .cornerRadius(10)
            
            
            //            }
            
            
            .options(options)
            .pagePadding(
                vertical: .absolute(50), horizontal: .absolute(80))
            
            //            ScalePageView(factListVM.facts, selection: $factListVM.selectedFactId){ fact in
            
            //            NavigationLink{
            //                if fact.imageName == "easy3"{
            //                                           CurvedSideRectangle()
            //                                       }
            //                                       if fact.imageName == "medium"{
            //                                           onboarding()
            //                                       }
            //
            //                                }label: {
            //
            //                                    Text("Choose Level")
            //                                        .font(.system(size: 16, weight: .bold, design: .rounded))
            //                                        .foregroundColor(Color.white)
            //                                }
            //                                .frame(width: 180, height: 50)
            //                                .background(Color(red: 0.21, green: 0.33, blue: 0.54))
            //                                .cornerRadius(20)
            //                .padding() }
            
            //                if factListVM.selectedFactId != nil{
            //                    DetailView(id: factListVM.selectedFactId, vm: factListVM)
            //                }
            
        } .onAppear{
            factListVM.fetch()
            
            
            
            //            if factListVM.selectedFactId != nil{
            //                DetailView(id: factListVM.selectedFactId, vm: factListVM)
            //            }
        } .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct Spin: View {
    
    @State var rotate = 0
    @Binding var movetoWorkout : Bool
    @Binding var isloading : Bool
    
    var body: some View {
        Text("BridgeView")
            .rotationEffect(Angle(degrees: Double(rotate)))
            .onTapGesture(perform: {
                withAnimation {
                    rotate = 360
                }
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    isloading.toggle()
                    movetoWorkout.toggle()
                }
            })
            .padding()
    }
}

