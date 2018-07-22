import UIKit

class MovieSearchResultTableViewCell: UITableViewCell {

    //MARK: Subviews
    
    private let outerStackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    private let innerStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.setContentHuggingPriority(UILayoutPriority(rawValue: 250.0), for: .horizontal)
        return stackView
    }()
    
    private let titleLabel: UILabel = {
       
        let label = UILabel()
        label.text = "Lion King"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "This is some really long description This is some really long description This is some really long description descriptionLabel descriptionLabel descriptionLabel descriptionLabel"
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let posterImageView: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "theMovieDB"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.arrangeSubviews()
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup subviews
    
    private func arrangeSubviews() {
        
        self.innerStackView.addArrangedSubview(self.titleLabel)
        self.innerStackView.addArrangedSubview(self.descriptionLabel)
        
        self.outerStackView.addArrangedSubview(self.posterImageView)
        self.outerStackView.addArrangedSubview(self.innerStackView)
        
        self.contentView.addSubview(self.outerStackView)
    }
    
    //MARK: Layout
    
    private func setupLayout() {
        self.setLayoutOuterStackView()
        self.setLayoutposterImageView()
        self.setLayoutInnerStackView()
    }
    
    
    func setLayoutOuterStackView() {
        
        self.outerStackView.topAnchor
            .constraint(equalTo: self.contentView.topAnchor)
            .isActive = true
        
        self.outerStackView.bottomAnchor
            .constraint(equalTo: self.contentView.bottomAnchor)
            .isActive = true
        
        self.outerStackView.leftAnchor
            .constraint(equalTo: self.contentView.leftAnchor)
            .isActive = true
        
        self.outerStackView.rightAnchor
            .constraint(equalTo: self.contentView.rightAnchor)
            .isActive = true
    }
    
    
    func setLayoutInnerStackView() {
        self.innerStackView.topAnchor
            .constraint(equalTo: self.outerStackView.topAnchor, constant: 20)
            .isActive = true
    }
    
    func setLayoutposterImageView() {
        
        self.posterImageView.widthAnchor
            .constraint(equalToConstant: 100)
            .isActive = true
    }
    
    //MARK: Configuration
    
    func configure(movie: Movie) {
        
        self.titleLabel.text = movie.title
        self.descriptionLabel.text = movie.overview
    }
}
