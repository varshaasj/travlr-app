//
//  FriendView.swift
//  app_v1
//
//  Created by Saifudden Ahmad Abdullah Nassar on 12/6/22.
//

import SwiftUI

struct FriendView: View {
    
    init() {
        coloredNavAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.configureWithTransparentBackground()
        coloredNavAppearance.backgroundColor = .orange
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance

    }
    
    @ObservedObject var vm = UserRepository()
    @ObservedObject var mvm = MainTripsViewModel()

    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
//                    Text("Friends List")
//                        .bold()
//                        .foregroundColor(.black)
//                        .font(.system(size: 18))
//                    Spacer()
                    ForEach (vm.users) { user in
                        FriendsListView(user: user)
                    }
                }.padding()
                    .navigationTitle("Friends")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct FriendsListView: View {
    @ObservedObject var vm = MainTripsViewModel()
    
    var user: User
    var body: some View {
        if vm.user?.id != user.id {
            VStack {
                HStack(spacing: 16) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 32))
                        .padding(8)
                        .overlay(RoundedRectangle(cornerRadius: 44)
                            .stroke(Color.black, lineWidth: 1))
                    VStack(alignment: .leading) {
                        Text(user.fname)
                            .font(.system(size: 20, weight: .bold))
                        NavigationLink(destination: TripView(user: user)) {
                            Text("View Trips").multilineTextAlignment(.trailing)
                                .font(.system(size: 14))
//                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    Spacer()
                }
                Divider()
                    .padding(.vertical, 8)
            }.padding(.horizontal)
        }
    }
}


//struct FriendView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendView()
//    }
//}
    
//RoundedRectangle(cornerRadius: 10).fill(.white)
//    .frame(width: 300, height: 60)
//    .shadow(radius: 3)
//    .overlay(alignment: .top){
//        VStack(alignment: .leading) {
//
//            Text(user.fname)
//                .font(.title).foregroundColor(Color.green)
//                .multilineTextAlignment(.trailing)
//                .font(.system(size:16, weight: .bold))
//
//            NavigationLink(destination: TripView(user: user)) {
//                Text("View Trips").multilineTextAlignment(.trailing)
//            }
//        }
//    }
//


//    .resizable()
//                .frame(width:100, height: 100)
//                .clipShape(Circle())

//
//    .font(.system(size: 32))
//    .padding(8)
//    .overlay(RoundedRectangle(cornerRadius: 44)
//        .stroke(Color.black, lineWidth: 1))
