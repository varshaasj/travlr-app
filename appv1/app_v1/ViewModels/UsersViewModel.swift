//
//  UsersViewModel.swift
//  app_v1
//
//  Created by Saifudden Ahmad Abdullah Nassar on 12/6/22.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
  @Published var userViewModel: [UserViewModel] = []
  private var cancellables: Set<AnyCancellable> = []

  @Published var userRepository = UserRepository()
  @Published var library: [User] = []
  
  init() {
      userRepository.$users.map { users in
      users.map(UserViewModel.init)
    }
    .assign(to: \.userViewModel, on: self)
    .store(in: &cancellables)
  }

  func add(_ user: User) {
      userRepository.add(user)
  }
}
