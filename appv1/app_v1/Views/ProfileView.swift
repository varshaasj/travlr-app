//
//  ProfileView.swift
//  travlrView
//
//  Created by Varshaa SJ on 11/7/22.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var vm = MainTripsViewModel()
    @ObservedObject var viewModel = TripRepository()
    
    var body: some View {
        NavigationView {
            VStack {
                    Image("man")
                    .resizable()
                    .frame(width: 200, height: 200)
                      .foregroundColor(.white)
                      .padding(3)
                        .overlay(RoundedRectangle(cornerRadius:110)
                            .stroke(Color.black, lineWidth: 1))
                        .foregroundColor(.orange)
                        .padding(12)
                
                VStack(alignment: .leading) {
                    
                    Text("first name").italic()
                    Text(vm.user?.fname ?? "")
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.orange)
                    
                    Text("last name").italic()
                    Text(vm.user?.lname ?? "")
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.orange)
                    
                    Text("email address").italic()
                    Text(vm.user?.email ?? "")
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.orange)

                }
                Spacer()
                
            }.padding()
                .navigationTitle("\(vm.user?.fname ?? "") \(vm.user?.lname ?? "")")
        }
    }
}


//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}

//                Text("\(viewModel.trips.count)")
