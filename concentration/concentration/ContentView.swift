//
//  ContentView.swift
//  Memorize
//
//  Created by Amy Lo on 7/16/21.
//

import SwiftUI

// structs are not object oriented
// :View defines that the struct acts as a view
// Views are made out of smaller views
// A view is just a rectangular area on screen
// Swift is a functional programming language

struct ContentView: View {
    var body: some View {
        VStack{
            CardRow()
            CardRow()
            CardRow()
            CardRow()
        }
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
}

struct CardView: View{
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text("🤡")
                .font(.largeTitle)
        }
    }
}

struct CardRow: View{
    var body: some View{
        ZStack{
            HStack{
                CardView()
                CardView()
                CardView()
                CardView()
            }
        }
    }
}

// This is the content preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
