//
//  Widget_CoreTests.swift
//  Widget CoreTests
//
//  Created by Tony Tran on 2021-01-21..
//

import Quick
import Nimble
import Nimble_Snapshots
import SwiftUI
@testable import Widget_Core

final class BoxScoreSmallViewSpec: QuickSpec {
    override func spec() {
        describe("a BoxScoreSmallViewSpec") {
            var subject: BoxScoreSmallView!

            it("should render correctly") {
                subject = BoxScoreSmallView()


                let view = subject.frame(width: 155, height: 155, alignment: .center).background(Color.black)
                let hostController = UIHostingController(rootView: view)
                hostController.view.frame = UIScreen.main.bounds
                _ = hostController.embedInWindow()

                 📷(hostController)
                expect(hostController).toEventually(haveValidSnapshot())
            }
        }
    }
}
