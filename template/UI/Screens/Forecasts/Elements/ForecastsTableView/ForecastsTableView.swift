import UIKit

final class ForecastsTableView: UITableView {
    
    private enum Section {
        case main
    }
    
    private var diffableDataSource: UITableViewDiffableDataSource<Section, ForecastViewCellInputData>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorStyle = .none
        delegate = self
        register(nibType: ForecastViewCell.self)
        diffableDataSource = UITableViewDiffableDataSource<Section, ForecastViewCellInputData>(tableView: self) { table, index, data in
            table.dequeueReusableCell(withType: ForecastViewCell.self, for: index).setup(with: data)
        }
    }
    
    func update(cellData: [ForecastViewCellInputData]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ForecastViewCellInputData>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cellData, toSection: .main)
        diffableDataSource?.apply(snapshot)
    }
}

extension ForecastsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        diffableDataSource?.itemIdentifier(for: indexPath)?.onSelect()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
