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

    let homeTeamLogo: UIImage?
    let awayTeamLogo: UIImage?

	var body: some View {
		VStack(spacing: Dimensions.spacingMedium) {
			HStack(spacing: Dimensions.spacingSmall) {
                Image(uiImage: image)
				Text("2nd - 3m ago")
					.font(FontStyles.captionStyle)
                    .foregroundColor(.appWhite)
			}
            HStack(spacing: 27) {
                TeamInfoView(logo: homeTeamLogo ?? UIImage(), team: "TOR", score: "6")
                TeamInfoView(logo: awayTeamLogo ?? UIImage(), team: "EDM", score: "8")
			}
		}
		.padding(.all, Dimensions.spacingLarge)
	}
}
