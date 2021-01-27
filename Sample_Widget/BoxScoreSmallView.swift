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

	var body: some View {
		VStack(spacing: Dimensions.spacingMedium) {
//            background(Color.green)
			HStack(spacing: Dimensions.spacingSmall) {
                Image(uiImage: image)
				Text("2nd - 3m ago")
					.font(FontStyles.captionStyle)
                    .foregroundColor(.appWhite)
			}
            HStack(spacing: 27) {
                TeamInfoView(logo: "Toronto_maple", team: "TOR", score: "6")
                TeamInfoView(logo: "Edmonton_Oilers", team: "EDM", score: "8")
			}
            .background(Color.orange)

		}
		.padding(.all, Dimensions.spacingLarge)
        .background(Color.green)

	}
}
