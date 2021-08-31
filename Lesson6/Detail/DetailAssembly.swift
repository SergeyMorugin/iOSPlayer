import UIKit

struct DetailAssembly {

  static func assemble(artistId: Int) -> UIViewController {
    let view = DetailViewController()
    let presenter = DetailPresenter()
    let networkService = NetworkService()
    let interactor = DetailInteractor(artistId: artistId, networkService: networkService)
    let router = DetailRouter()

    view.output = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.output = presenter

    return view
  }
}
