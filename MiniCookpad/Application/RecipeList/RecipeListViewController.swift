import UIKit
import Firebase
import Foundation
import FirebaseFirestoreSwift

class RecipeListViewController: UIViewController {
    private var recipes: [FirestoreRecipe] = []
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    private let recipeCollection = Firestore.firestore().collection("recipes")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDummyDataButton()

        title = "レシピ一覧"
        
        view = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: "RecipeTableViewCell")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        refresh()
    }

    func showRecipes(_ recipes: [FirestoreRecipe]) {
        self.recipes = recipes
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        refreshControl.endRefreshing()
        let alertController = UIAlertController(title: "エラー", message: "レシピの取得に失敗しました。もう一度お試しください。\n\(error.localizedDescription)", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "閉じる", style: .default, handler: nil)
        alertController.addAction(closeAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func refresh() {
        refreshControl.beginRefreshing()
        
        let dataStore = RecipeDataStore()
        dataStore.fetchAllRecipes { [weak self] result in
            switch result {
            case let .success(recipes):
                self?.showRecipes(recipes)
            case let .failure(error):
                self?.showError(error)
            }
        }
    }
}

extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let recipeID = recipes[indexPath.row].id {
            let vc = RecipeDetailsViewController(recipeID: recipeID)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell") as? RecipeTableViewCell else {
            fatalError()
        }
        let recipe = recipes[indexPath.row]
        cell.configure(recipe: recipe)
        return cell
    }
}

extension RecipeListViewController {
    // 初期データを追加するためのダミーボタン
    private func setUpDummyDataButton() {
        let dummyDataButton = UIBarButtonItem(title: "データ追加", style: .plain, target: self, action: #selector(didTapDummuDataButton))
        navigationItem.leftBarButtonItem = dummyDataButton
    }
    
    @objc private func didTapDummuDataButton() {
        DummyData.insert()
    }
}
