//
//  ContentView.swift
//  Bucket List
//
//  Created by Saurabh Dhingra on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentDate: Date = .init()
    
    @State var weekSlider: [Date.WeekDay] = []
    @State var currentWeekIndex: Int = 0
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            VStack(alignment: .leading, content:{
                Text("Calendar").font(.system(size: 36, weight: .semibold))
                
                TabView(selection: $currentWeekIndex,
                        content: {
                    ForEach(weekSlider.indices, id: \.self){ index in
                            let week = weekSlider[index]
                        
                        weekView(week)
                            .tag(index)
                        
                    }
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
            })
            .padding()
            .frame(maxWidth: .infinity)
            .background{Rectangle().fill(.gray.opacity(0.1)).ignoresSafeArea().clipShape(.rect(bottomLeadingRadius: 30,
                                                                                               bottomTrailingRadius: 30))}
            .clipShape(.rect(cornerRadius: 40))
            
            Spacer()
        })
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func weekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0){
            ForEach(week) { day in
                VStack {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.system(size: 20))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
