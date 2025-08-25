//
//  HomeController.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 21.08.2025.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func displayNews(_ news: [News])
    func showLoading(_ isLoading: Bool)
    func showError(_ message: String)
}

final class HomeViewController: UIViewController {
    
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    var presenter: HomeViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPresenter()
    }

    // Methods
    private func setupUI() {
        title = "Новости"
        view.backgroundColor = .white
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        tableView.refreshControl = refreshControl
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        view.addSubview(tableView)
    }
    
    private func setupPresenter() {
        presenter = HomePresenter(view: self)
        presenter.viewDidLoad()
    }
    
    @objc private func refreshData() {
        presenter.refreshData()
    }

}

extension HomeViewController: HomeViewControllerProtocol {
    func displayNews(_ news: [News]) {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
    
    func showLoading(_ isLoading: Bool) {
        if isLoading && !refreshControl.isRefreshing {
            // Показать индикатор загрузки
        } else if !isLoading {
            // Скрыть индикатор загрузки
        }
    }
    
    func showError(_ message: String) {
        refreshControl.endRefreshing()
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        let newsItem = presenter.news[indexPath.row]
        cell.configure(with: newsItem)
        return cell
    }
}
