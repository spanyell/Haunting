//
//  WaterLetterView.swift
//  WaterLetters
//
//  Created by Dan Beers on 3/30/21.
//

import SwiftUI

struct WaterLetterView: View
{
    @State var moveLetters = true
    @State var turnLetters = true
    @State var opacityLetters = true
    @State var growCircle = true
    @State var shadowFadeLetter = true

    var body: some View
    {
        ZStack
        {
            Color(.black)
            Circle().stroke(Color.white)
                // Creates the drop effect with a black circle and a white outline that will grow ontap
                .frame(width: growCircle ? 0 : 4000, height: growCircle ? 0 : 4000)
            VStack
            {
                HStack
                {
                    // Move and rotate action on each letter from the ontap
                    Text("H")
                        .offset(x: moveLetters ? 0 : -60, y: moveLetters ? 0 : -90)
                        .rotationEffect(.degrees(turnLetters ? 0 : -40))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : 15, y: shadowFadeLetter ? 0 : 5)

                    Text("E")
                        .offset(x: moveLetters ? 0 : -10, y: moveLetters ? 0 : -130)
                        .rotationEffect(.degrees(turnLetters ? 0 : -20))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : 10, y: shadowFadeLetter ? 0 : 15)

                    Text("L")
                        .offset(x: moveLetters ? 0 : 60, y: moveLetters ? 0 : -110)
                        .rotationEffect(.degrees(turnLetters ? 0 : -10))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : -10, y: shadowFadeLetter ? 0 : 15)

                    Text("P")
                        .offset(x: moveLetters ? 0 : 70, y: moveLetters ? 0 : -70)
                        .rotationEffect(.degrees(turnLetters ? 0 : 40))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : -15, y: shadowFadeLetter ? 0 : 5)
                }

                HStack
                {
                    Text("M")
                        .offset(x: moveLetters ? 0 : -100, y: moveLetters ? 0 : 40)
                        .rotationEffect(.degrees(turnLetters ? 0 : -30))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : 15, y: shadowFadeLetter ? 0 : -15)

                    Text("E")
                        .offset(x: moveLetters ? 0 : 80, y: moveLetters ? 0 : 50)
                        .rotationEffect(.degrees(turnLetters ? 0 : 30))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : -15, y: shadowFadeLetter ? 0 : -15)
                }
            }
            .font(Font.custom("Hoefler Text", size: 30))
            .foregroundColor(.white)
            // Allows letters to disappear using opacity set to 0.
            .opacity(opacityLetters ? 1 : 0)
            .onTapGesture
            {
                withAnimation(Animation
                    .easeOut(duration: 4))
                {
                    growCircle.toggle()
                }
                // Allowing a short delay between the drop effect and the letter skewing.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
                {
                    withAnimation(Animation
                        .easeOut(duration: 5))
                    {
                        moveLetters.toggle()
                        turnLetters.toggle()
                        shadowFadeLetter.toggle()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5)
                {
                    withAnimation(Animation
                        .easeOut(duration: 3))
                    {
                        opacityLetters.toggle()
                        shadowFadeLetter.toggle()
                    }
                }
            }
        }
    }
}

struct WaterLetterView_Previews: PreviewProvider
{
    static var previews: some View
    {
        WaterLetterView()
    }
}
