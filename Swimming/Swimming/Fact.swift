//
//  Fact.swift
//  swimming
//
//  Created by Vargo Alfonso on 17/05/22.
//


import Foundation
import SwiftUI

struct Fact: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let photoCredit: String
    let caption: String
}

//extension Fact{
//    static func all () = [Fact] {
//        return [
//            Fact(title: "Sleeping Otters", imageName: "easy3", photoCredit: "commons.wikimedia.org", caption: "Sea otters hold hands when they sleep to keep from drifting apart"),
//            Fact(title: "Smile for the Blind", imageName: "medium", photoCredit: "Sachiho", caption: "Blind people smile even though they’ve never seen anyone else smile."),
//            Fact(title: "Breathing Turtles", imageName: "advance", photoCredit: "TaraDSturm", caption: "Turtles can breathe through their butts."),
//        ]
//    }
//}

