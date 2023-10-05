//
//  FruitsViewModel.swift
//  MVVMassignment
//
//  Created by Morgan Pence on 10/4/23.
//

import Foundation
import Combine

@MainActor class FruitsViewModel: ObservableObject {
    @Published var fruits = [Fruit]()
    
    func getAllFruits() async -> () {
        do {
            let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            Task { @MainActor in
                fruits = try JSONDecoder().decode([Fruit].self, from: data)
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
