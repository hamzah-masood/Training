import UIKit
import SnapKit

final class EpisodeCell: UITableViewCell {
    let nameLabel: UILabel
    let previewImageView: UIImageView
    let numberLabel: UILabel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        nameLabel = UILabel()
        previewImageView = UIImageView()
        numberLabel = UILabel()

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        nameLabel.textColor = UIColor(named: "DarkGrey")
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        numberLabel.textColor = UIColor(named: "Grey")
        numberLabel.font = .preferredFont(forTextStyle: .caption1)

        addSubview(nameLabel)
        addSubview(previewImageView)
        addSubview(numberLabel)

        previewImageView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
            make.width.equalTo(120)
            make.height.equalTo(previewImageView.snp.width).dividedBy(16.0 / 9.0).priority(.high)
        }

        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(previewImageView.snp.top).offset(8)
            make.left.equalTo(previewImageView.snp.right).offset(16)
            make.right.lessThanOrEqualToSuperview().inset(16)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(8)
            make.left.equalTo(numberLabel.snp.left)
            make.right.lessThanOrEqualToSuperview().inset(16)
            make.bottom.lessThanOrEqualToSuperview().inset(16)
        }

        previewImageView.layer.cornerRadius = 10
        previewImageView.clipsToBounds = true
        previewImageView.backgroundColor = .lightGray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
