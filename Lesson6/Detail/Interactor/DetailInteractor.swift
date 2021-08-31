import Foundation

final class DetailInteractor {
  weak var output: DetailInteractorOutput?
  private let networkService: NetworkServiceProtocol

  private let artistId: Int

  init(artistId: Int, networkService: NetworkServiceProtocol) {
    self.artistId = artistId
    self.networkService = networkService
  }
}

extension DetailInteractor: DetailInteractorInput {

  func obtainDetails() {
    networkService.fetchArtist(forId: artistId){ [weak self] result in
      guard let self = self else { return }
      switch result {
      case let .success(artist):
        self.output?.presentDetails(for: artist)
      case let .failure(error):
        print(error)
      }
    }
  }
}
