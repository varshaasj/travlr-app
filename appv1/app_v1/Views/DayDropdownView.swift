//
//  DayDropdownView.swift
//  app_v1
//
//  Created by Emma Herrera on 12/12/22.
//

import SwiftUI

struct DayDropdownView: View {
	@State private var isExpanded = false
	var day: Int
  //very important for the bug fix with updating elements
	@StateObject var viewModel: TripElementRepository
	var trip: Trip
    var body: some View {
      
     
		DisclosureGroup("Day " + String(day), isExpanded: $isExpanded) {
			VStack (spacing: 10) {
				ForEach (viewModel.elements) { elem in
					DayElemView(element: elem, trip: trip, day: day)
				}
			}.padding(.all) // end of dropdown vstack
		}.accentColor(.orange) // end of dropdown
			.font(.title2)
			.foregroundColor(.orange)
			.padding(.all)
			.background(Color.white)
			.cornerRadius(8)
    }
}

