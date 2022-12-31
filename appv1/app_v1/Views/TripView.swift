//
//  TripView.swift
//  app_v1
//
//  Created by Saifudden Ahmad Abdullah Nassar on 12/6/22.
//

import SwiftUI

struct TripView: View {
    @ObservedObject var vm = MainTripsViewModel()
    @ObservedObject var viewModel = TripRepository()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var user: User
    
    var body: some View {
        VStack {
            ScrollView{
                ForEach (viewModel.trips) { trip in
                    FriendTripsView(user: user, trip: trip)
                }
            }
        }.padding()
            .navigationTitle("\(user.fname)'s Trip History")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }
    
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

struct FriendTripsView: View {
    @State private var dragAmount = CGSize.zero
    @ObservedObject var vm = MainTripsViewModel()

    var user: User
      
      var trip: Trip
      let date = Date.now
      var body: some View {
              if user.id ==  trip.userID {
                  VStack {
                      RoundedRectangle(cornerRadius: 10).fill(.white)
                          .frame(width: 300, height: 400)
                          .shadow(radius: 3)
                      
                      
                      //                    .background(LinearGradient(colors: [.orange, .red],
                      //                                       startPoint: .top,
                      //                                       endPoint: .center))
                          .overlay(alignment: .top){
                              VStack(alignment: .leading) {
                                  Image("roadtrip-image")
                                      .resizable()
                                      .frame(width:300, height:200)
                                      .cornerRadius(10, corners: [.topLeft, .topRight])
                                  VStack(alignment: .leading) {
                                      
                                      Text(trip.name)
                                          .font(.title).foregroundColor(Color.green)
                                          .multilineTextAlignment(.leading)
                                          .font(.system(size:16, weight: .bold))
                                      Text(trip.destination).multilineTextAlignment(.leading).font(.headline)
                                          .foregroundColor(.secondary)
                                      Divider()
                                      //Text(trip.endDate.formatted(date: .long, time:.omitted)).multilineTextAlignment(.leading)
                                      //Text("Group: @abc, @def")
                                      //      .font(.system(size: 12, weight:.light))
                                      //      .fontWeight(.light)
                                      //      .multilineTextAlignment(.leading)
                                      //added nav link to details
                                      
                                      HStack() {
                                          VStack(alignment: .leading){
                                              Text(trip.endDate.formatted(date: .long, time:.omitted))
                                                  .multilineTextAlignment(.leading)
                                              Text("Group: @abc, @def")
                                                  .font(.system(size: 12, weight:.light))
                                                  .fontWeight(.light)
                                                  .multilineTextAlignment(.leading)
                                          }
                                          
                                          Divider().padding()
                                          NavigationLink(destination: TripDetailView(trip: trip)) {
                                              Text("View Details").multilineTextAlignment(.trailing)
                                          }
                                      }
                                  }.padding()
                                  
                              }
                              
                              
                          }
                      
                  }.offset(dragAmount)
                      .gesture(
                          DragGesture()
                              .onChanged{dragAmount = $0.translation}
                              .onEnded{ _ in dragAmount = .zero }
                          
                      )
                      .animation(.spring(), value: dragAmount)
                  
                  
              }
          }
      }



 
