/*
* Copyright (c) 2016 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class MainViewController: UIViewController {
  
  // Graph view displays on landscape
  @IBOutlet var graphView: GraphView!
  
  // Shows arc and pointer to see percentage spent overall
  @IBOutlet var summaryView: SummaryView!
  
  // Save bar button items in landscape
  private var rightBarButtonItem:UIBarButtonItem?
  private var leftBarButtonItem:UIBarButtonItem?
  
  private var budgetTableViewController:BudgetTableViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    rightBarButtonItem = navigationItem.rightBarButtonItem
    leftBarButtonItem = navigationItem.leftBarButtonItem
    
    let image = UIImage(named: "pennywise_logo")
    navigationItem.titleView = UIImageView(image: image)
    calculateBudget()
  }
  
  // unwind methods
  @IBAction func cancelToMain(segue:UIStoryboardSegue) {
  }
  
  private func calculateBudget() {
    // recalculate totals
    let totalSpent = categories.reduce(0) { $0 + $1.spent}
    let totalBudget = categories.reduce(0) { $0 + $1.budget}
    if totalBudget > 0 {
      summaryView.percentSpent = totalSpent / totalBudget
    }
  }
  
  // MARK:- Orientation changes
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    if size.width > size.height {
      // add graph view to the screen
      // and define the constraints
      view.addSubview(graphView)
      graphView.translatesAutoresizingMaskIntoConstraints = false
        graphView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        graphView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        graphView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        graphView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
      
      // hide navigation bar buttons on landscape
      navigationItem.rightBarButtonItem = nil
      navigationItem.leftBarButtonItem = nil
      
    } else {
      graphView.removeFromSuperview()
      
      // show navigation bar buttons
      navigationItem.rightBarButtonItem = rightBarButtonItem
      navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .all }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    guard let identifier = segue.identifier else { return }
    switch identifier {
    case "AddExpense":
        guard let navigationController = segue.destination as? UINavigationController  else { return }
      if let controller = navigationController.viewControllers[0] as? ExpenseViewController  {
        controller.delegate = self
      }
    case "CategoryExpense":
        guard let navigationController = segue.destination as? UINavigationController  else { return }
      if let controller = navigationController.viewControllers[0] as? ExpenseViewController,
         let indexPath = sender as? NSIndexPath {
          controller.selectedCategory = categories[indexPath.row]
          controller.delegate = self
      }
    case "BudgetTableViewController":
        if let controller = segue.destination as? BudgetTableViewController {
        controller.tableView.delegate = self
        budgetTableViewController = controller
      }
    default: ()
    }
  }
}

extension MainViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // iOS bug delays presentation of new view controller
    // can be fixed by not using Selection: None in Cell but
    // this does not look good
    // https://forums.developer.apple.com/message/12349#12349
    
    DispatchQueue.main.async {
        self.performSegue(withIdentifier: "CategoryExpense", sender: indexPath)
    }
  }
}

extension MainViewController: ExpenseViewControllerDelegate {

  // Do all updates here
  func expenseViewController(expenseViewController: ExpenseViewController, didExpenseCategory category: Category?, amount:Float) {
    dismiss(animated: true, completion: {
      if let category = category {
    
        if let index = categories.firstIndex(of: category) {
            let indexPath = IndexPath(row: index, section: 0)
            
          category.spent += amount
          self.calculateBudget()

            UIView.animate(withDuration: 0.3, animations: {
                self.budgetTableViewController?.tableView.scrollToRow(at: indexPath, at: .none, animated: false)
            }, completion: { finished in
                self.budgetTableViewController?.tableView.reloadRows(at: [indexPath], with: .left)
          })
        }
      }
    })
  }
}

extension UINavigationController {
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let visibleViewController = visibleViewController {
            return visibleViewController.supportedInterfaceOrientations
        } else {
            return .portrait
        }
    }
}
