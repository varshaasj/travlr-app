//
//  TripDetailView.swift
//  app_v1
//
//  Created by Varshaa SJ on 11/10/22.
//
import SwiftUI

struct TripDetailView: View {
      @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
      var trip: Trip
      let date = Date.now
      @State private var presentAdd = false
      @ObservedObject var viewModel = TripElementRepository()
      @State private var isExpanded = false
	
      let dateFormatter = DateFormatter()
      
	
      var body: some View {
          VStack {
              Spacer()
              VStack (spacing: 10) {
                      
                      HStack {
                              Text("Trip Duration").font(.title3).frame(alignment: .leading)
                              Text(trip.startDate.formatted(.dateTime.day().month().year()) + " - " + trip.endDate.formatted(.dateTime.day().month().year())).font(.headline)
                      }.frame(maxWidth: .infinity, alignment: .leading)
			  //			  Text("Trip Duration: " + dateFormatter.string(from: trip.startDate) + " to " + dateFormatter.string(from: trip.endDate))
			  //				  .font(.title3)
			  //			  Text("Trip Duration: " + trip.startDate.toString() + " to " + trip.endDate.toString())
			  //				  .font(.title3)
			  //            Text(trip.startDate.toString())
			  //                  .bold()
			  //            Text("-")
			  //            Text(trip.endDate.toString())
			  //                  .bold()
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle(trip.name)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: backButton)
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                              Button(action: {presentAdd.toggle()}, label: {
                                Image(systemName: "plus").foregroundColor(.white)
                              }).sheet(isPresented: $presentAdd) {
                                NewElementView(trip: trip, days: daysBetween(start: trip.startDate, end: trip.endDate), model: viewModel, presentAdd: $presentAdd)
                                
                              }
                            }
                        }
                      HStack{
                              Text("Destination: " + trip.destination).font(.title3)
                              }.frame(maxWidth: .infinity, alignment: .leading)
                     // HStack{
                      //        Text("Group: ")
                       //       .font(.title3)
                              //Text("@varshaa, @saif")
                            //  .font(.title3)
                            //  .foregroundColor(.green)
                        // later change to user icons or something
                   //   }.frame(maxWidth: .infinity, alignment: .leading)
		  }.padding(.all)// top page vstack
     
            
      ScrollView {
              ForEach(1..<(daysBetween(start: trip.startDate, end: trip.endDate))) { day in
                    VStack{
                      
                     
                        DayDropdownView(day: day, viewModel: viewModel, trip: trip)
                    }.padding(.all)
			  
              }
      }
     
      }
      }//body
  
    var backButton: some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            })
        }
}


