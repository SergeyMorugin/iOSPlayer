//
//  ListModule.swift
//  Lesson6
//
//  Created by Matthew on 31.08.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

protocol ListViewOutput {
  func viewIsReady()
  
  var listCount: Int { get }
  func obtainArtist(atIndex: Int) -> Artist?
  func onListItemClick(_ index: Int)
}

protocol ListViewInput: class {
  func reloadData()
}

protocol ListRouterInput {
  func gotoDetails(id: Int)
}

protocol ListInteractorInput{
  func obtainArtists()
}

protocol ListInteractorOutput: class {
  func updateArtists(_ artists: [Artist])
}

