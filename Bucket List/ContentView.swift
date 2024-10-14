//
//  ContentView.swift
//  Bucket List
//
//  Created by Saurabh Dhingra on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
