//
//  TeamInfoView.swift
//  TSM Widget Extension
//
//  Created by Tony Tran on 2021-01-13.
//  Copyright © 2021 Score Media Ventures. All rights reserved.
//

import SwiftUI

struct TeamInfoView: View {
	// MARK: Properties

    let logo: String
	let team: String
	let score: String

	var body: some View {
		VStack(spacing: Dimensions.spacing) {
			VStack(spacing: Dimensions.spacingSmall / 2) {
				Image(logo)
					.frame(width: 40, height: 40)
					.aspectRatio(contentMode: .fit)
				Text(team)
					.font(FontStyles.bodyStyle)
					.foregroundColor(.appWhite)
			}

			Text(score)
				.font(FontStyles.title1Style)
				.foregroundColor(.appWhite)
		}
	}
}
