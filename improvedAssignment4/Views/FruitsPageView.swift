//
//  FruitsPageView.swift
//  improvedAssignment4
//
//  Created by Morgan Pence on 9/26/23.
//

import SwiftUI


struct FruitsPageView : View {
    @State var fruits = [Fruit]()
    @State var fruitDetails = [FruitDetails]()
    @State var selectedFruit: Fruit?
    @State private var searchText: String = ""
    
    func getAllFruits() async -> () {
        do {
            let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            fruits = try JSONDecoder().decode([Fruit].self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    var searchFruit: [Fruit] {
        if searchText.isEmpty {
            return fruits
        } else {
            return fruits.filter {$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationView {
            List(fruits) { fruit in
                VStack(alignment: .leading) {
                    Text("\(fruit.name) • \(fruit.family)")
                    Button("Nutrition Info") {
                        selectedFruit = fruit
                    }
                    
                }
                
            }
            .task {
                await getAllFruits()
            }
            .sheet(item: $selectedFruit){ fruit in
                SheetView(fruit: fruit)
            }
        }
        .navigationTitle("Fruit")
        .searchable(text: $searchText, prompt: "Search Fruits")
    }
    
    
}

struct FruitsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsPageView()
    }
}

