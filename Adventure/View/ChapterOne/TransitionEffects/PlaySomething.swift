//
//  PlaySomething.swift
//  Adventure
//
//  Created by Dan Beers on 2/26/21.
//

import AVKit
import SwiftUI

struct PlaySomething: View {
    
    @State var musicEffect = try! AVAudioPlayer(data: Constants.oneOneMusic!.data, fileTypeHint: "mp3")
    @State var musicEffect2 = try! AVAudioPlayer(data: Constants.oneTwoMusic!.data, fileTypeHint: "mp3")
// USE THIS!!!!!!
        
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear() {
                musicEffect = try! AVAudioPlayer(data: Constants.oneOneMusic!.data, fileTypeHint: "mp3")
                musicEffect2 = try! AVAudioPlayer(data: Constants.oneTwoMusic!.data, fileTypeHint: "mp3")
                musicEffect.play()
                musicEffect.numberOfLoops = -1
            }
            .onTapGesture {
                musicEffect.numberOfLoops = 1

            }
        
    }
}

struct PlaySomething_Previews: PreviewProvider {
    static var previews: some View {
        PlaySomething()
    }
}
