//
//  UtilitiesManager.swift
//  Adventure
//
//  Created by Dan Beers on 4/7/21.
//

import Foundation

class UtilitiesManager: ObservableObject
{
    static let shared = UtilitiesManager()
    
    var viewedChoices = [String]()
}
