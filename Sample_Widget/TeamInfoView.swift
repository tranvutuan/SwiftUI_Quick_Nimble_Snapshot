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

	let team: String
	let score: String
    let logoURL: URL?
    
	var body: some View {
		VStack(spacing: Dimensions.spacing) {
			VStack(spacing: Dimensions.spacingSmall / 2) {
                NetworkImage(url: logoURL)
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

struct NetworkImage: View {
    let url: URL?

    var body: some View {
        Group {
            if let url = url, let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {

                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
            }
            else {
                Image("Toronto_maple")
            }
        }
    }
}
