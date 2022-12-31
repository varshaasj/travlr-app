//
//  TripViewModel.swift
//  app_v1
//
//  Created by Saif Nassar on 05/11/2022.
//

import Foundation
import Combine

class TripViewModel: ObservableObject, Identifiable {

  private let tripRepository = TripRepository()
  @Published var trip: Trip
  private var cancellables: Set<AnyCancellable> = []
  var id = ""

  init(trip: Trip) {
    self.trip = trip
    $trip
      .compactMap { $0.id }
      .assign(to: \.id, on: self)
      .store(in: &cancellables)
  }
}
