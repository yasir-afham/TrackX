//
//  TrackXApp.swift
//  TrackX
//
//  Created by Yasir Afham.
//

import SwiftUI

@main
struct TrackX: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Transaction.self])
    }
}
