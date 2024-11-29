
import UIKit

import SnapKit

class EpisodeCell: UICollectionViewCell {

    //MARK: - Properties

    private let episodeCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setupCornerRadius(8)
        return imageView
    }()

    private let episodeBadgeLabel: UILabel = {
        let label = UILabel()
        label.text = "무료"
        label.textColor = .white
        label.backgroundColor = .clear
        label.setupBorder(1, color: .grey4)
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)