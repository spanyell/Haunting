//
//  DoorOpen.swift
//  Adventure
//
//  Created by Dan Beers on 2/26/21.
//

import AVKit
import SwiftUI
import Unrealm

struct DoorOpen: View {
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @State var doorOpenEffect = true
    @State var textWalkForward = true
    
    @State var doorOpenAndCreakSound: AVAudioPlayer!


    var body: some View {

        ZStack {
            Color(.black)
                .frame(alignment: .center)
                .onAppear {
                    if let doorOpenAndCreak = NSDataAsset(name: "DoorOpenAndCreak")
                    {
                        doorOpenAndCreakSound = try! AVAudioPlayer(data: doorOpenAndCreak.data, fileTypeHint: "mp3")
                    }
                }
            VStack
            {
                Text("THE\nDOOR\nGROANS\nOPEN.").multilineTextAlignment(.trailing)
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 70))
                    .rotation3DEffect(
                        .degrees(doorOpenEffect ? 0 : -76),
                        axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/,
                        anchor: .trailing,
                        anchorZ: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
                        perspective: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/
                    )
                    .scaleEffect(textWalkForward ? 1: 500)
                    .onTapGesture {
                        withAnimation(Animation.easeInOut(duration: 3)) {
                            doorOpenEffect.toggle()
                        }
                        doorOpenAndCreakSound.play()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation(Animation.easeInOut(duration: 3)) {
                                textWalkForward.toggle()
                            }
                        }
                    }
            }
        }
    }
}

struct DoorOpen_Previews: PreviewProvider {
    static var previews: some View {
        DoorOpen()
    }
}
