//
//  NewElementView.swift
//  app_v1
//
//  Created by Emma Herrera on 12/3/22.
//
import SwiftUI

struct NewElementView: View {
    var trip: Trip
    var days: Int
    var model: TripElementRepository
    @Binding var presentAdd: Bool
//  @ObservedObject var elementsViewModel = ElementsViewModel(repo: model)
    
    @State private var title = ""
    @State private var elemType = "Transportation"
    @State private var time = Date.now
    @State private var description = ""
    @State private var day = 1
    @State private var tripID = ""
    
    @State var notifyFriends: Bool = false
    
    var elemTypeOptions = ["Transportation", "Lodging", "Excursion", "Meal"]
    var dayOptions = [Int]()
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Categorization")) {
                        TextField("Title", text: $title)
                        Picker("Element Type", selection: $elemType) {
                            ForEach(elemTypeOptions, id:\.self) {
                                Text($0)
                            }
                        } // outer picker
                    }
                    Section(header: Text("Details")) {
                        DatePicker("Please enter a time", selection: $time, displayedComponents: .hourAndMinute)
//                        if #available(iOS 16.0, *) {
//                            TextField("Description", text: $description, axis: .vertical)
//                        } else {
                            // Fallback on earlier versions
                            TextField("Description", text: $description)
//                        }
                        Picker("Day", selection: $day) {
//                            ForEach(0 ..< days.count) {
//                                Text(self.days[$0]).tag(day)
//                            }
                            ForEach(1..<days+1, id:\.self) {i in
                                Text("\(i)")
                            }
                        }
                    }
                    Section(header: Text("Travel Group")) {
                        Toggle(isOn: $notifyFriends) {
                            Text("Notify friends of change to itinerary")
                        }
                    }
                    Section {
                        Button(action: {
                            if self.isValidElement(){
                                addElement()
                                presentAdd = false
                               // clearElemFields()
                                
                            } else {
                            }
                        }) {
                            Text("Create Element")
                        }
//                        if self.isValidElement() {
////                            Button(action: {
////                                print("Submitting element")
////                            }) {
////                                Text("Create Element")
////                            }
//                            Button(action: {
//                                addElement()
//                                clearElemFields()
//                            }) {
//                                Text("Create Element")
//                            }
////                            Button("Create Element") {
////                                addElement()
////                                clearElemFields()
////
////                            }
//                        }
                    }
                }// outer form
                .navigationBarTitle("Create New Element", displayMode: .inline)
                
            } // outer VStack
        } // outer NavView
    }// outer body
    
    private func isValidElement() -> Bool {
        print("This is title \(title)")
        print("This is the elemType \(elemType)")
        print("This is the description \(description)")
        print("This is the day \(day)")
        if title.isEmpty { return false }
        if elemType.isEmpty { return false }
        if description.isEmpty { return false }
        if day == 0 {return false}
        return true
      }

      private func clearElemFields() {
          title = ""
          elemType = ""
          //@State private var time = Date.now
          description = ""
          day = 0
      }
      
      private func addElement() {
        
		  let element = Element(title: title, elemType: elemType, time: time, description: description, day: day, tripID: trip.id!, tripName: trip.name)
//          elementsViewModel.add(element)
        model.add(element)
        
      }
      
} // outer struct
func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day! + 2
}

//func initializeDays(dayOption: [Int], days: Int){
//    for i in 1 ... days {
//        dayOption.append(i)
//    }
//}
