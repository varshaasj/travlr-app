//
//  FriendListView.swift
//  app_v1
//
//  Created by Saifudden Ahmad Abdullah Nassar on 12/6/22.
//

import SwiftUI

struct FriendListView: View {
    
    var user: User
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 10).fill(.white)
                .frame(width: 300, height: 400)
                .shadow(radius: 3)
                .overlay(alignment: .top){
                    VStack(alignment: .leading) {
                        Image("roadtrip-image")
                            .resizable()
                            .frame(width:300, height:200)
                            .cornerRadius(10, corners: [.topLeft, .topRight])
                        VStack(alignment: .leading) {
                            
                            Text(user.fname)
                                .font(.title).foregroundColor(Color.green)
                                .multilineTextAlignment(.leading)
                                .font(.system(size:16, weight: .bold))
                        }
                    }
                }
        }
    }
}
