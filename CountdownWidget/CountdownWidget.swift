//
//  CountdownWidget.swift
//  CountdownWidget
//
//  Created by cnwang on 2021/4/29.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for minuteOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset * 10, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    
    
}

struct CountdownWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    @StateObject var countdownVM = CountdownViewModel()
    
    var body: some View {
        ZStack{
//            Image("tesla-400")
//                .resizable()
//                .scaledToFit().opacity(0.3)
            WidgetProgressView()
                .environmentObject(countdownVM)
            if widgetFamily == .systemLarge {
                HStack {
                    Text(entry.date, style: .time)
                    Text(entry.date.description)
                    VStack{
//                    Text("\(countdownVM.dateFrom.description)")
//                    Text("\(countdownVM.dateTo.description)")
                    }
//                        .font(.footnote)
                }.opacity(0.9)
                .offset(y: 90)
            }
        } //:ZStack
        .onAppear(perform: {
            print("Widget onAppear")
        })
        
    }
}

@main
struct CountdownWidget: Widget {
    let kind: String = "CountdownWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CountdownWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Countdown Widget")
        .description("Countdown Widget (only small, currently)")
    }
}

struct CountdownWidget_Previews: PreviewProvider {
    @StateObject var countdownVM = CountdownViewModel()
    static var previews: some View {
        Group {
            CountdownWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            //                .environmentObject(countdownVM)
                        CountdownWidgetEntryView(entry: SimpleEntry(date: Date()))
                            .previewContext(WidgetPreviewContext(family: .systemMedium))
            ////                .environmentObject(countdownVM)
                        CountdownWidgetEntryView(entry: SimpleEntry(date: Date()))
                            .previewContext(WidgetPreviewContext(family: .systemLarge))
//                            .environmentObject(countdownVM)
        }
    }
}
