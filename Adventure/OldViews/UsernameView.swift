//
//  UsernameView.swift
//  Adventure
//
//  Created by Dan Beers on 2/18/21.
//

import SwiftUI

struct UsernameView: View {
    @AppStorage("username") var username: String = ""
    @AppStorage("adminAccess") var adminAccess: String = "Admin"
    @AppStorage ("storyCheckpoint") var storyCheckpoint: Int = 1
    var body: some View {
        VStack {
            Text("Enter Username")
            TextField("Username", text: $username)
        }
    }
}


struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameView()
    }
}
