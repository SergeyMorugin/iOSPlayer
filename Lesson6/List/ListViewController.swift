import UIKit

class ListViewController: UIViewController {
  let tableCellIdentifier = "cell"
  let tableView: UITableView = UITableView(frame: .zero, style: .plain)
  var presenter: ListViewOutput!


  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    presenter.viewIsReady()
  }
    
  private func configureUI() {
    view.backgroundColor = .white
    title = "Artists"
    configureTableView()
  }
  
  private func configureTableView() {
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints =  false
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableCellIdentifier)
    tableView.dataSource = self
    tableView.delegate = self
  }
}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.onListItemClick(indexPath.row)
    /*tableView.deselectRow(at: indexPath, animated: true)
    let id = elements[indexPath.row].identifier
    let viewController = DetailAssembly.assemble(artistId: id)
    self.navigationController?.pushViewController(viewController, animated: true)*/
  }
}

extension ListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.listCount
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath)
    cell.accessoryType = .disclosureIndicator
    if let artist = presenter.obtainArtist(atIndex: indexPath.row)  {
      cell.textLabel?.text = artist.name
    }
  
    return cell
  }
}

extension ListViewController: ListViewInput {
  func reloadData() {
    tableView.reloadData()
  }
}

// MARK: - Data




