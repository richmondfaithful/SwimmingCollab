//
//  card.swift
//  swimming
//
//  Created by Vargo Alfonso on 18/05/22.
//

import SwiftUI

struct Landmark: Identifiable{
    var id = UUID()
    var title: String
    var detail: String
    var detail2: String
    var image: String
}

var landmarksData = [
    Landmark(title: "Sidestroke", detail: "14 minutes", detail2: "1 minute break", image: "icon"),
    Landmark(title: "Breakstroke", detail: "14 minutes", detail2: "1 minute break", image: "icon"),
    Landmark(title: "Katak", detail: "14 minutes", detail2: "1 minute break", image: "icon"),
    Landmark(title: "Dada Gaya", detail: "14 minutes", detail2: "1 minute break", image: "icon")
]


struct card: View {
    @State var tapped = false
    
    var body: some View {
        let array = landmarksData
        let random = array.randomElement()!
        
        ZStack{
            if !tapped{
            HStack {
                Image(random.image)
                    .padding(.trailing,15)
            VStack(alignment: .leading){
                Text(random.title)
                    .bold()
                    .padding(.top,20)
                Text(random.detail)
                    .foregroundColor(Color.gray)
                Text(random.detail2)
                    .foregroundColor(Color.gray)
                    .padding(.bottom,20)
            }
            .frame(width: 250)
            .background(Color(.white))
            .cornerRadius(20)
            .shadow(color: Color(.white), radius: 5, x: 0, y: 5)
        }
            }
        
//            else{
//                VStack{
//
//                VStack(alignment: .leading){
//                    Text("gaya katak")
//                        .font(.title.weight(.bold))
//                        .padding()
//                    Spacer()
//                    Text(random.title)
//                        .font(.title.weight(.medium))
//                        .padding()
//                    Text("jadi vide0")
//                        .font(.footnote.weight(.medium))
//                        .padding()
//                    Spacer()
//                }
//                .frame(width: 400,height: 1000, alignment: .leading)
//                .background(Color(.white))
//
//
//                }
//
//            }
        }
        
        .onTapGesture{
            withAnimation{
                tapped.toggle()
            }
        }
}
}

struct card_Previews: PreviewProvider {
    static var previews: some View {
        card()
    }
}
