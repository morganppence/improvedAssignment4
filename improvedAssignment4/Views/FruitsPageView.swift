//
//  FruitsPageView.swift
//  MVVMassignment
//
//  Created by Morgan Pence on 9/26/23.
//

import SwiftUI
import Foundation

struct FruitsPageView : View {
    @State var fruitDetails = [FruitDetails]()
    @State var selectedFruit: Fruit?
    @State private var searchText: String = ""
    
    @ObservedObject var fruitsViewModel = FruitsViewModel()
    
    var searchFruit: [Fruit] {
        if searchText.isEmpty {
            return fruitsViewModel.fruits
        } else {
            return fruitsViewModel.fruits.filter {$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationView {
            List(fruitsViewModel.fruits) { fruit in
                VStack(alignment: .leading) {
                    Text("\(fruit.name) • \(fruit.family)")
                    Button("Nutrition Info") {
                        selectedFruit = fruit
                    }
                    
                }
                
            }
            .task {
                await fruitsViewModel.getAllFruits()
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

