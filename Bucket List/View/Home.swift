//
//  Home.swift
//  Bucket List
//
//  Created by Saurabh Dhingra on 10/10/24.
//

import SwiftUI


struct Home: View {
    
    @State private var currentDate: Date = .init()
    var body: some View {
        VStack(alignment: .leading, spacing: 0,content: {
            HeaderView()
        })
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        ZStack {
            VStack(alignment: .leading, spacing: 6){
                HStack(spacing: 5){
                    Text($currentDate.wrappedValue.format("MMMM"))
                        .foregroundStyle(.blue)
                    
                    Text($currentDate.wrappedValue.format("YYYY"))
                        .foregroundStyle(.gray)
                    
                }
                .font(.title.bold())
                
                Text(currentDate.formatted(date: .complete, time: .omitted))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.gray)
            }
//            .overlay
            .padding(15)
            .hSpacing(.leading)
            .background(.white)
        }
    }
}

#Preview {
    ContentView()
}
