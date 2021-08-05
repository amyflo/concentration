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

// Show a different number of cards and chooses between three sets of arrays (weather, vehicles, faces)
struct ContentView: View {
    var weather_emojis = ["🌤", "⛅", "🌥", "🌦", "☁", "🌧", "⛈", "🌩", "🌞", "⚡", "🌨", "☃", "⛄", "🌬", "💨", "🌪", "🌫", "🌈", "☔", "💧", "💦", "🌊", "🧣", "🧤", "🌂"]
    
    let vehicle_emojis = ["🚗", "🚙", "🚕", "🛺", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🛵", "🚲", "🦼", "🦽", "🛴", "🛹", "🛼", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚝", "🚄", "🚅", "🚈", "🚞", "🚂", "🚆", "🚇", "🚊", "🚉", "🚁", "🛩", "✈", "🛫", "🛬", "🪂", "💺", "🛰", "🚀", "🛸", "🛶", "⛵", "🛥", "🚤", "⛴", "🛳", "🚢", "⚓"]
    
    var face_emojis = ["😘", "😗", "😙", "😚", "😋", "😛", "😝", "😜", "🤪", "🤨", "🧐", "🤓", "😎", "🥸", "🤩", "🥳", "😏", "😒", "😞", "😔", "😟", "😕", "🙁", "☹️", "😣", "😖", "😫", "😩", "🥺", "😢", "😭", "😤", "😠"]
    
    // setting default array to weather emojis
    @State var emojis: Array<String> = ["🌤", "⛅", "🌥", "🌦", "☁", "🌧", "⛈", "🌩", "🌞", "⚡", "🌨", "☃", "⛄", "🌬", "💨", "🌪", "🌫", "🌈", "☔", "💧", "💦", "🌊", "🧣", "🧤", "🌂"]
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.title)
            
            ScrollView{
                // random number of cards
                let emojiCount = Int.random(in: 8...(emojis.count - 1))
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0...emojiCount], id: \.self) {
                        emoji in CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.foregroundColor(.red)
            
            Spacer()
            
            // Buttons
            HStack{
                weather
                Spacer()
                vehicles
                Spacer()
                face
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    //  Whenever face button is pressed, sets emojis array to weather
    var weather: some View{
        Button{
            emojis = weather_emojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "sun.min")
                Text("Weather")
                    .font(.caption)
            }
        }
    }
    
    //  Whenever face button is pressed, sets emojis array to vehicles
    var vehicles: some View{
        Button{
            emojis = vehicle_emojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "car")
                Text("Vehicles")
                    .font(.caption)
            }
        }
    }
    
    //  Whenever face button is pressed, sets emojis array to cars
    var face: some View{
        Button{
            emojis = face_emojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "eyes")
                Text("Faces")
                    .font(.caption)
            }
        }
    }
}

struct CardView: View{
    @State var faceUp: Bool = true
    var content: String
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if faceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture{
            faceUp = !faceUp
        }
    }
}

// This is the content preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
