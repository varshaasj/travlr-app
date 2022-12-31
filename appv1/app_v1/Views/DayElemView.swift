//
//  DayElemView.swift
//  app_v1
//
//  Created by Emma Herrera on 12/9/22.
//

import SwiftUI

struct DayElemView: View {
	var element: Element
	var trip: Trip
	var day: Int
	var body: some View {
		//if ((element.tripID == trip.id) && (day == element.day)) {
		if ( (day == element.day) && (element.tripName == trip.name)) {
			VStack {
				RoundedRectangle(cornerRadius: 10).fill(.orange)
					.frame(width: 300, height: 225, alignment: .trailing)
					.shadow(radius: 3)
				
				
				//                    .background(LinearGradient(colors: [.orange, .red],
				//                                       startPoint: .top,
				//                                       endPoint: .center))
					.overlay(alignment: .top){
						VStack (spacing: 8){
							Text("\(element.title)").foregroundColor(.white).font(.title).padding(.all)
							Text("Type: \(element.elemType)").foregroundColor(.white)
								.font(.title3)
								.frame(maxWidth: 280, alignment: .leading)
							Text("Time: \(element.time.formatted(date: .omitted, time: .shortened))").foregroundColor(.white)
								.font(.title3)
								.frame(maxWidth: 280, alignment: .leading)
							Text("Description: \(element.description)")
								.foregroundColor(.white)
								.font(.title3)
								.frame(maxWidth: 280, alignment: .leading)
						} .frame(width: 300, height: 225)
					}
				
			}.frame(width: .infinity, alignment: .trailing) // outer VStack
		}
		//}
	}// outer body
}// outer struct
