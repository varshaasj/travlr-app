//
//  NewTripView.swift
//  app_v1
//
//  Created by Saif Nassar on 05/11/2022.
//
import SwiftUI

struct NewTripView: View {
  
        
    @ObservedObject var libraryViewModel = LibraryViewModel()
    @ObservedObject var vm = MainTripsViewModel()
    @Binding var isPresented: Bool

    
    @State private var name = ""
    @State private var destination = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var userID = ""
    @State private var imageTag = ""
    let images = ["#city", "#nature", "#food", "#amusement", "#roadtrip"]
 // @State private var immage
//    @State private var element = [String?]()
    
    
    var body: some View {
        NavigationView{
        VStack {
          
            Form{
                DatePicker(
                        "Start Date",
                        selection: $startDate,
                        displayedComponents: [.date]
                    )
                DatePicker(
                        "End Date",
                        selection: $endDate,
                        displayedComponents: [.date]
                    )
                        TextField("Trip Name", text: $name)
                        TextField("Destination", text: $destination)
              //TextField("Trip Type", text: $imageTag)
              Section{
                HStack {
                  
                Text("Trip Type")
                Spacer()
                Picker("Trip Type", selection: $imageTag) {
                                               ForEach(images, id: \.self) {
                                                 Text($0)
                                                   .fontWeight(.medium)
                                                   .foregroundColor(Color.gray)
                                                   .multilineTextAlignment(.center)
                                               }
                }.pickerStyle(.menu)
                }
              }
                                
                if self.isValidTrip() {
                          Button("Add Trip") {
                            addTrip()
                            isPresented = false
                           // clearFields()
            }
            }
    }
}
        .navigationTitle("New Trip")
        .navigationBarTitleDisplayMode(.inline)
            
}
    }
    
    private func isValidTrip() -> Bool {
        if name.isEmpty { return false }
        if destination.isEmpty { return false }
        return true
      }

      private func clearFields() {
        name = ""
        destination = ""
      }
      
      private func addTrip() {
        let trip = Trip(name: name, destination: destination, startDate: startDate, endDate: endDate, userID: vm.user?.id, imageTag: imageTag ?? "nil")
        libraryViewModel.add(trip)
      }
}
