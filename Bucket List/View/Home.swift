//
//  Home.swift
//  Bucket List
//
//  Created by Saurabh Dhingra on 10/10/24.
//

import SwiftUI


struct Home: View {
    
    @State private var currentDate: Date = .init()
    @State private var weekSilder: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 1
    @State private var createWeek: Bool = false

    // Animation Namespace
    @Namespace private var animation

    var body: some View {
        VStack(alignment: .leading, spacing: 0,content: {
            HeaderView()
        })
        .vSpacing(.top)
        .onAppear(perform: {
            if weekSlider.isEmpty { 
                let currentWeek = Date().fetchWeek()

                if let firstDate = currentWeek.first?.date { 
                    weekSlider.append(firstDate.createPreviousWeek())
                }

                weekSlider.append(currentweek)

                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.createNextWeek())
                }
            }
        })
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
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
            TabView(selection: $currentWeekIndex){
                ForEach(weekSlider.indices, id : \.self) { index in
                    let week = weekSlider[index]
                    WeekView(week)
                        .padding(.horizontal, 15)
                        .tag(index)
                }
                .padding(.horizontal, -15)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 90)
            }
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing, context: {
            Button(action: {},label : {
            Image(.pic)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 45, height: 45)
                .clipShape(.circle)
            })
        })
        .padding(15)
        .background(.white)
        .onChange(of: currentWeekIndex, initial: false) { oldValue ,newValue in 
            if newValue == 0 || newValue == (weekSlider.count - 1) {
                createWeek = true
            }
        }
    }

    @ViewBuilder
    func WeekView(_ week: [Date.Weekday]) -> some View {
        HStack(spacing: 0){
            ForEach(week) { day in 
                VStack(spacing: 8){
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)

                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.bold)
                        .textScale(.secondary)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .gray)
                        .frame(width: 35, height: 35)
                        .background(content: {
                            if isSameDate(day.date, currentDate){
                                Circle()
                                    .fill(.darkBlue)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }

                            if day.date.isToday {
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 12)
                            }
                        })
                        .background(.white.shadow(.drop(radius: 1)), in: .circle)
                        .contentShape(.rect)
                        .onTapGesture {
                            withAnimation(.snappy){
                                currentDate = day.date
                            }
                        }
                }
                .hSpacing(.center)
            }
        }
        .background {
            GeometryReader {
                let minX = $0.frame(in: .global).minX

                Color.clear
                    .preference(key: OffsetKey.self, value : minX)
                    .onPreferenceChange(OffsetKey.self) { value in
                        if value.rounded() == 15 && createWeek {
                            print("Generate")
                            createWeek = false
                        }
                    }
            }
        }
    }

}

#Preview {
    ContentView()
}
