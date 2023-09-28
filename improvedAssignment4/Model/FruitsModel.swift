//
//  FruitsModel.swift
//  improvedAssignment4
//
//  Created by Morgan Pence on 9/27/23.
//

import Foundation
import SwiftUI

struct Fruit: Codable, Identifiable {
    var id: Int
    var name: String
    var family: String
    var nutritions: FruitDetails
    

}

struct FruitDetails: Codable {
    var calories: Int
    var fat: Double
    var sugar: Double
    var carbohydrates: Double
    var protein: Double
    
}
