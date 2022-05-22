//
//  FactListViewModel.swift
//  swimming
//
//  Created by Vargo Alfonso on 17/05/22.
//
//
//  FactListViewModel.swift
//  Happy Facts
//
//  Created by Stewart Lynch on 2021-05-17.
//

import Foundation

class FactListViewModel: ObservableObject {
    @Published var facts:[Fact] = []
    @Published var selectedFactId:UUID?
    
    func fetch() {
        facts = [
            Fact(title: "Sleeping Otters", imageName: "easy3", photoCredit: "commons.wikimedia.org", caption: "Sea otters hold hands when they sleep to keep from drifting apart"),
            Fact(title: "Smile for the Blind", imageName: "medium", photoCredit: "Sachiho", caption: "Blind people smile even though they’ve never seen anyone else smile."),
            Fact(title: "Breathing Turtles", imageName: "advance", photoCredit: "TaraDSturm", caption: "Turtles can breathe through their butts."),
          //  Fact(title: "Tree Planters", imageName: "easy", photoCredit: "Irene Mei", caption: "Squirrels plant thousands of new trees each year simply by forgetting where they put their acorns."),
           // Fact(title: "Chinese Panda", imageName: "easy", photoCredit: "Cute Baby Animals", caption: "In China, killing a Panda is punishable by death."),
           // Fact(title: "Penguin Marriage", imageName: "easy", photoCredit:"telegraph.co.uk", caption: "Gentoo penguins propose to their lifemates with a pebble.")
        ]
        selectedFactId = facts[0].id
    }
    
    func selectedFact(id: UUID?) -> Fact? {
        return facts.first(where: {$0.id == id})
    }
}


