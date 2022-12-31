//
//  UserViewModel.swift
//  app_v1
//
//  Created by Saifudden Ahmad Abdullah Nassar on 12/6/22.
//

import Foundation
import Combine

class UserViewModel: ObservableObject, Identifiable {

  private let userRepository = UserRepository()
  @Published var user: User
  private var cancellables: Set<AnyCancellable> = []
  var uid = ""

  init(user: User) {
    self.user = user
    $user
      .compactMap { $0.id }
      .assign(to: \.uid, on: self)
      .store(in: &cancellables)
  }
}

