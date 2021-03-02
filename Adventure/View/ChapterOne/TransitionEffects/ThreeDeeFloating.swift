//
//  ThreeDeeFloating.swift
//  Adventure
//
//  Created by Dan Beers on 2/25/21.
//

import SwiftUI

struct ThreeDeeFloating: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @State var fade1 = true
    @State var fade2 = true
    @State var fade3 = true
    @State var move1 = true
    @State var move2 = true
    @State var move3 = true

    var body: some View
    {
        ZStack
        {
            Color.black
                .frame(alignment: .center)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 15))
                .scaleEffect(move1 ? 0 : 50)
                .offset(x: fade1 ? -100 : -700, y: fade1 ? -300 : -3000)
            Text("Goodbye, World!")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 20))
                .scaleEffect(move1 ? 0.25 : 1)
                .offset(x: fade1 ? 100 : 400, y: 300)
                .offset(x: fade2 ? 0 : -100, y: fade2 ? 0 : -100)
            Text("Hello, goodbye, World!")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 25))
                .scaleEffect(move1 ? 0.5 : 1)
                .offset(x: fade1 ? 0 : 500, y: fade1 ? 0 : 500)
                .offset(x: fade2 ? -250 : -500, y: fade2 ? 0 : -250)
                .onAppear
                {
                    withAnimation(.easeInOut(duration: 2))
                    {
                        move1.toggle()
                        fade1.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                    {
                        withAnimation(.easeInOut(duration: 5))
                        {
                            fade2.toggle()
                        }
                    }
                }
        }
    }
}

struct ThreeDeeFloating_Previews: PreviewProvider
{
    static var previews: some View
    {
        ThreeDeeFloating()
    }
}
