//
//  NetworkService.swift
//  Lesson6
//
//  Created by Matthew on 31.08.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

enum Result<T> {
  case success(T)
  case failure(Error)
}

protocol NetworkServiceProtocol {
  typealias ArtistsResult = (Result<[Artist]>) -> ()
  typealias ArtistDetailResult = (Result<Artist>) -> ()
  
  func fetchArtists(_ completion: @escaping ArtistsResult )
  
  func fetchArtist(forId id: Int, _ completion: @escaping ArtistDetailResult)
}

final class NetworkService: NetworkServiceProtocol {
  func fetchArtists(_ completion: @escaping ArtistsResult) {
    completion(.success([ArtistStubFactory.example()]))
  }
  
  func fetchArtist(forId id: Int, _ completion: @escaping ArtistDetailResult) {
    completion(.success(ArtistStubFactory.example()))
  }
}


