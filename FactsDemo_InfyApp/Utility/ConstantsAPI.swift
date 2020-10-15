//
//  Constants.swift
//  FactsDemo_InfyApp
//
//  Created by Akash on 12/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

let baseUrl:String = "https://dl.dropboxusercontent.com"
let factsExtensionUrl:String = "/s/2iodh4vg0eortkl/facts.json"

enum Message:String {
    case NoInternetConnection = "no_internet_connection"
    case AlertTitle           = "error"
    var Localized: String {
        return self.rawValue.localized
    }
}
