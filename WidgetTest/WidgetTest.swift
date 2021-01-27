//
//  WidgetTest.swift
//  WidgetTest
//
//  Created by Tony Tran on 2021-01-21..
//
/*
import Quick
import Nimble
import Nimble_Snapshots
import SwiftUI
@testable import Sample_WidgetExtension

final class BoxScoreSmallViewSpec: QuickSpec {
    override func spec() {
        describe("a BoxScoreSmallViewSpec") {
            var subject: BoxScoreSmallView!

            it("should render correctly") {
                subject = BoxScoreSmallView()

                // For now we are testing with the size at 155x155. We should cover all sizes which listed at here
                // https://developer.apple.com/design/human-interface-guidelines/ios/system-capabilities/widgets/
                let view = subject.frame(width: 155, height: 155, alignment: .center).background(Color.black)
                let hostController = UIHostingController(rootView: view)
                hostController.view.frame = UIScreen.main.bounds
                _ = hostController.embedInWindow()

                 📷(#file, line: #line, snapshottable: hostController)
                expect(hostController).toEventually(haveValidSnapshot())
            }
        }
    }
}
*/
