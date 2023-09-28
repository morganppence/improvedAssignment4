//
//  SheetView.swift
//  improvedAssignment4
//
//  Created by Morgan Pence on 9/26/23.
//


import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    let fruit : Fruit
    
    var body: some View {
        VStack{
            Button("Press to close sheet") {
                dismiss()
            }
            .font(.title)
            .padding()
            .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 20, style:.continuous))
            Text("Here's that info!")
            Text("Fruit : \(fruit.name)")
            Text("calories: \(fruit.nutritions.calories)")
            Text("fat: \(fruit.nutritions.fat, specifier: "%.2f")")
            Text("sugar: \(fruit.nutritions.sugar, specifier: "%.2f")")
            Text("carbohydrates: \(fruit.nutritions.carbohydrates, specifier: "%.2f")")
            Text("protein: \(fruit.nutritions.protein, specifier: "%.2f")")
            
                
            }
            
        }
    }
