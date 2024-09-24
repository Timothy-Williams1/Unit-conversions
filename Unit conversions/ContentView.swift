//
//  ContentView.swift
//  Unit conversions
//
//  Created by Student on 9/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var startingTemp = 0.0
    @State private var endingTemp = 0.0
    @State private var startingMeasurment = "Celsius"
    @State private var endingMeasurment = "Celsius"
    @FocusState private var amountIsFocused: Bool
    
    let measurments = ["Celsius","Fahrenheit","Kelven"]
    
    var convertingTemp: Double {
        var newTemp = startingTemp
    
  
    if startingMeasurment == "Celsius" &&
        endingMeasurment == "Celsius" {
            return newTemp
        }
    
    if startingMeasurment == "Fahrenheit" &&
        endingMeasurment == "Fahrenheit" {
            return newTemp
        }
        if startingMeasurment == "kelven" &&
            endingMeasurment == "Kelven" {
                return newTemp
            }
    // Skipping Celsius (conv others to Cels)
        if startingMeasurment == "Fahrenheit" {
            newTemp = (newTemp - 32) / 1.8
        } else if startingMeasurment == "Kelven" {
            newTemp = newTemp - 273.15
        }
        
        // conv from Cels to Fahr or kel
        if endingMeasurment == "Fahrenheit" {
            newTemp = newTemp * 1.8 + 32
        } else if endingMeasurment == "Kelven" {
            newTemp = newTemp + 273.15
        }
      // returnes coverted value
    return newTemp
}

var body: some View {
    NavigationStack {
        Form{
            Section("Select a starting temperature"){
                Picker("Temperature Measurement",selection: $startingMeasurment){
                    ForEach(measurments, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Temperature", value: $startingTemp, format: .number)
                    .keyboardType(.numberPad)
                    .focused($amountIsFocused)
            }
            
            Section("Select a measuerment to convert to"){
                Picker("Temperature Measurement",selection: $endingMeasurment){
                    ForEach(measurments, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                Text(convertingTemp, format: .number)
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                if amountIsFocused {
                    Button("Done"){
                        amountIsFocused = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
