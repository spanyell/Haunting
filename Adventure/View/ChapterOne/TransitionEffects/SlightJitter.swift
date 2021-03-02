//
//  SlightJitter.swift
//  Adventure
//
//  Created by Dan Beers on 2/26/21.
//

import SwiftUI

struct SlightJitter: View
{
    @State var move1 = true
    @State var move2 = true
    @State var move3 = true
    @State var move4 = true

    var body: some View
    {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .offset(x: move1 ? 0 : 2, y: 0)
            .offset(x: 0, y: move2 ? 0 : 2)
            .offset(x: 0, y: move3 ? 0 : -4)
            .offset(x: move4 ? 0 : -4, y: 0)
            .onAppear
            {
                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever())
                {
                    move1.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                {
                    withAnimation(Animation.easeInOut(duration: 1).repeatForever())
                    {
                        move2.toggle()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                {
                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever())
                    {
                        move3.toggle()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                {
                    withAnimation(Animation.easeInOut(duration: 1).repeatForever())
                    {
                        move4.toggle()
                    }
                }
            }
    }
}

struct SlightJitter_Previews: PreviewProvider
{
    static var previews: some View
    {
        SlightJitter()
    }
}
