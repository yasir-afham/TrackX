//
//  StatsCardView.swift
//  TrackX Widget
//
//  Created by Yasir Afham on 2025-05-21.
//

import WidgetKit
import SwiftUI

struct WidgetEntry: TimelineEntry {
    let date: Date
    let income: Double
    let expense: Double
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: .now, income: 0, expense: 0)
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetEntry) -> Void) {
        let entry = WidgetEntry(date: .now, income: 4560, expense: 3220)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> Void) {
        let entry = WidgetEntry(date: .now, income: 4560, expense: 3220)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct TrackXWidgetView: View {
    let entry: WidgetEntry

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.black, Color.blue.opacity(0.8)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 12) {
                Text("📈 TrackX")
                    .font(.title2.bold())
                    .foregroundColor(.white)

                Divider()
                    .background(.white.opacity(0.3))

                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Income")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.6))
                        Text("LKR \(Int(entry.income))")
                            .font(.headline)
                            .foregroundColor(.green)
                    }

                    Spacer()

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Expense")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.6))
                        Text("LKR \(Int(entry.expense))")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                }

                Spacer()

                Text("Your finances, simplified.")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.4))
            }
            .padding()
        }
        .containerBackground(for: .widget) {
            Color.clear
        }
    }
}

@main
struct TrackXWidget: Widget {
    let kind: String = "TrackXWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TrackXWidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("TrackX Summary")
        .description("View your income and expenses at a glance.")
    }
}

#Preview(as: .systemMedium) {
    TrackXWidget()
} timeline: {
    WidgetEntry(date: .now, income: 8900, expense: 4200)
}
