//
//  Sample_Widget.swift
//  Sample_Widget
//
//  Created by Tony Tran on 2021-01-21..
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        var entry = SimpleEntry(date: currentDate,configuration: configuration)

        let group = DispatchGroup()

        group.enter()
        ImageLoader().load(url: URL(string: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png")!) { image in
            entry.homeTeamLogo = image
            group.leave()
        }

        group.enter()
        ImageLoader().load(url: URL(string: "https://homepages.cae.wisc.edu/~ece533/images/boat.png")!) { image in
            entry.awayTeamLogo = image
            group.leave()
        }

        group.notify(queue: DispatchQueue.global()) {
            entries.append(entry)

            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    var homeTeamLogo: UIImage?
    var awayTeamLogo: UIImage?

    init(date: Date, configuration: ConfigurationIntent, homeTeamLogo: UIImage? = nil, awayTeamLogo: UIImage? = nil) {
        self.date = date
        self.configuration = configuration
        self.homeTeamLogo = homeTeamLogo
        self.awayTeamLogo = awayTeamLogo
    }
}

struct Sample_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color.appBlack.edgesIgnoringSafeArea(.all)
            BoxScoreSmallView(homeTeamLogo: entry.homeTeamLogo, awayTeamLogo: entry.awayTeamLogo)
        }
    }
}

@main
struct Sample_Widget: Widget {
    let kind: String = "Sample_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Sample_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Sample_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Sample_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
