import UIKit

class MovieSearchViewController: UIViewController {
    
    //MARK: Subviews
    
    private let movieDBImageView: UIImageView = {
        
        let imageName = "theMovieDB.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let movieTextField:UITextField = {
        
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 2.0
        textField.layer.masksToBounds = false
        textField.layer.shadowRadius = 2.0
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: 1, height: 1)
        textField.layer.shadowOpacity = 1.0
   
        textField.attributedPlaceholder = NSAttributedString(string: "Search for movie", attributes: [kCTForegroundColorAttributeName as NSAttributedStringKey : UIColor.lightGray])
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextFieldViewMode.always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let searchButton:UIButton = {
        
        let button = UIButton(type:.system)
        button.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        button.setTitle("Search", for: .normal)
        button.tintColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 2
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(searchMovie), for: .touchUpInside)
        return button
    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(movieDBImageView)
        
        self.view.addSubview(movieTextField)
        self.view.addSubview(searchButton)
        
        self.setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Layout
    
    private func setupLayout() {
        
        self.setUpAutoLayoutMovieDBImageView()
        self.setUpAutoLayoutMovieTextInput()
        self.setUpAutoLayoutSearchButton()
    }
    
    private func setUpAutoLayoutMovieTextInput () {
        movieTextField.topAnchor
            .constraint(equalTo: movieDBImageView.bottomAnchor, constant:40)
            .isActive = true
        
        movieTextField.leftAnchor
            .constraint(equalTo: self.view.leftAnchor, constant:20)
            .isActive = true
        
        movieTextField.rightAnchor
            .constraint(equalTo: self.view.rightAnchor, constant: -20)
            .isActive = true
        
        movieTextField.heightAnchor
            .constraint(equalToConstant: 50)
            .isActive = true
    }
    
    private func setUpAutoLayoutSearchButton () {
        searchButton.topAnchor
            .constraint(equalTo:movieTextField.bottomAnchor, constant:35)
            .isActive = true
        
        searchButton.widthAnchor
            .constraint(equalTo: self.view.widthAnchor, multiplier: 0.4)
            .isActive = true
        
        searchButton.heightAnchor
            .constraint(equalTo: movieTextField.heightAnchor, multiplier: 0.9)
            .isActive = true
        
        searchButton.centerXAnchor
            .constraint(equalTo: view.centerXAnchor)
            .isActive = true
    }

    private func setUpAutoLayoutMovieDBImageView () {
        movieDBImageView.topAnchor
                        .constraint(equalTo:self.view.topAnchor, constant: self.view.frame.height/6)
                        .isActive = true
        
        movieDBImageView.centerXAnchor
                        .constraint(equalTo: view.centerXAnchor)
                        .isActive = true
        
        movieDBImageView.widthAnchor
                        .constraint(equalTo: self.view.widthAnchor, multiplier: 0.4)
                        .isActive = true
        
        movieDBImageView.heightAnchor.constraint(equalTo: movieDBImageView.widthAnchor, multiplier: 1)
                        .isActive = true
    }
    
    //MARK: Control Events Handlers
    
    @objc private func searchMovie(sender: UIButton!) {
        
        let controller = MovieSearchResultViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

