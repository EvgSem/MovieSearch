import UIKit

class MovieSearchResultViewController: UITableViewController {

    private let cellIdentifier = "SearchResultCell"
    private let viewModel: MovieSearchResultViewModel
    
    
    //MARK: Init
    
    init(viewModel: MovieSearchResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(MovieSearchResultTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        self.getMoviesData()
    }
    
    private func getMoviesData() {
        
        self.viewModel.queryNextMoviesBatch { isSuccessful in
            
            if isSuccessful {
                
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.movies.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        guard let resultCell = cell as? MovieSearchResultTableViewCell else {
            preconditionFailure()
        }
        
        let movie = self.viewModel.movies[indexPath.row]
        resultCell.configure(movie: movie)
        
        if indexPath.row == self.viewModel.movies.count - 1 {
            if viewModel.moreMoviesAvavilable() {
                getMoviesData()
            }
        }
        
        return cell
    }
}
