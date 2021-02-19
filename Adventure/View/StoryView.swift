//
//  StoryView.swift
//  Adventure
//
//  Created by Dan Beers on 2/18/21.
//

import SwiftUI
import Unrealm


struct StoryView: View {
    @StateObject var storyDataViewModel = StoryDataViewModel()
    
    var body: some View {
        ZStack {
            Color(.black)
            Color.black
                .frame(alignment: .center)
            VStack {
                Text("\(storyDataViewModel.storyDataList[0].dataDescription)")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 20))
                    
            }
        }.navigationBarHidden(true)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
