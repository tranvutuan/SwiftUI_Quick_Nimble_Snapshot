//
//  BoxScoreSmallView.swift
//  TSM Widget Extension
//
//  Created by Tony Tran on 2021-01-10.
//  Copyright © 2020 Score Media Ventures. All rights reserved.
//

import SwiftUI

struct BoxScoreSmallView: View {
	// MARK: Properties

    var image: UIImage {
        guard let image = UIImage(named: "live_1") else {
            fatalError("Missing \"lived image\"...")
        }

        return image
    }
    let homeTeamLogoURL: URL?
    let awayTeamLogoURL: URL?

	var body: some View {
		VStack(spacing: Dimensions.spacingMedium) {
			HStack(spacing: Dimensions.spacingSmall) {
                Image(uiImage: image)
				Text("2nd - 3m ago")
					.font(FontStyles.captionStyle)
                    .foregroundColor(.appWhite)
			}
            HStack(spacing: 27) {
                TeamInfoView(team: "TOR", score: "6", logoURL: homeTeamLogoURL)
                TeamInfoView(team: "EDM", score: "8", logoURL: awayTeamLogoURL)
			}
		}
		.padding(.all, Dimensions.spacingLarge)
	}
}
