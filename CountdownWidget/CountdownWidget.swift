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
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
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
    var targetDate: Date{
        let fmt = ISO8601DateFormatter()
        fmt.timeZone = TimeZone.current
        return fmt.date(from: "2021-05-29T14:00:00+0800")!
    }
    var body: some View {
//        Text(entry.date, style: .time)
        ZStack{
            Image("tesla")
                .resizable()
                .scaledToFit().opacity(0.3)
            VStack{
                Text("Model 3 is coming ")
                    .font(.headline)
                    .padding()
                HStack(alignment:.bottom){
                    Text("\(difference(targetDate: targetDate).value, specifier: "%0.0f")")
                        .font(widgetFamily == .systemSmall ? .system(size: 60) : .system(size: 80))
                        .fontWeight(.bold)
                    Text( "\(difference(targetDate: targetDate).unit)")
                        .font(.caption)
                }
            } //:VStack
            
        }
    }
}

@main
struct CountdownWidget: Widget {
    let kind: String = "CountdownWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CountdownWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct CountdownWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountdownWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            CountdownWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            CountdownWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
