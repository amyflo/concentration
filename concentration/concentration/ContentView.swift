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
    var emojis = ["😘", "😗", "😙", "😚", "😋", "😛", "😝", "😜", "🤪", "🤨", "🧐", "🤓", "😎", "🥸", "🤩", "🥳", "😏", "😒", "😞", "😔", "😟", "😕", "🙁", "☹️", "😣", "😖", "😫", "😩", "🥺", "😢", "😭", "😤", "😠"]
    @State var emojiCount = 15
    
    var body: some View{
        VStack{
            Text("Memorize!")
                .font(.title)
            
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        emoji in CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.foregroundColor(.red)
            
            Spacer()
            
            HStack{
                remove
//                Spacer()
//                weather
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    var weather: some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "sun.min")
        }
    }
    
    var add: some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var remove: some View{
        Button{
            if emojiCount > 1 {
                emojiCount -= 1}
        } label: {
            Image(systemName: "minus.circle")
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
