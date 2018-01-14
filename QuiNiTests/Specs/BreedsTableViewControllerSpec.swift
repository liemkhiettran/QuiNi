import Quick
import Nimble

@testable import QuiNi

class BreedsTableViewControllerSpec: QuickSpec {
  override func spec() {
    
    var viewController: BreedsTableViewController!
    var tableView: UITableView!
    var cell: UITableViewCell!
    let storyboard = UIStoryboard(name:"Main", bundle: Bundle.main)
    
    beforeEach {
      viewController = storyboard.instantiateViewController(withIdentifier: "breedsTableViewControllerID") as! BreedsTableViewController
      tableView = viewController.tableView
    }
    
    describe("viewDidLoad"){
      
      beforeEach{
        let _ = viewController.viewDidLoad()
        let indexPath = IndexPath(row: 0, section: 0)
        cell = viewController.tableView.cellForRow(at: indexPath)
      }
      
      it("should register class UITableViewCell"){
        
        if let cell = cell {
          
          expect(cell).to(be(UITableViewCell()))
        }
      }
      
      it("should have ponyCellReuseIdentifier for reuse indentifier"){
        
        if let cell = cell {
          expect(cell.reuseIdentifier).to(equal("ponyCellReuseIdentifier"))
        }
      }
    }
    
    
    
    describe("numberOfSectionsInTableView"){
      
      it("should be 1"){
        expect(tableView.numberOfSections).to(equal(1))
      }
    }
    
    describe("cellForRowAtIndexPath"){
      
      beforeEach {
        let indexPath = IndexPath(row: 0, section: 0)
        cell = viewController.tableView.cellForRow(at: indexPath)
      }
      
      it("should dequeue cell with ponyCellReuseIdentifier indentifier") {
        
        if let cell = cell {
          expect(cell.reuseIdentifier).to(equal("ponyCellReuseIdentifier"))
        }
      }
      
      it("should be an instance of UITableViewCell") {
        
        if let cell = cell {
          
          expect(cell).to(be(UITableViewCell()))
        }
      }
      
      context("when first cell is dequeued"){
        
        it("should have Shetland as textLabel text"){
          
          if let cell = cell {
            expect(cell.textLabel!.text!).to(equal("Shetland"))
          }
        }
        
        it("should have an image named shetland") {
          
          if let cell = cell {
            expect(cell.imageView!.accessibilityIdentifier).to(equal("shetland"))
          }
        }
      }
      
      context("when second cell is dequeued"){
        
        beforeEach {
          let indexPath = IndexPath(row: 1, section: 0)
          cell = viewController.tableView.cellForRow(at: indexPath)
        }
        
        it("should have Welsh as textLabel text"){
          
          if let cell = cell {
            expect(cell.textLabel!.text!).to(equal("Welsh"))
          }
        }
        
        it("should have an image named welsh") {
          
          if let cell = cell {
            expect(cell.imageView!.accessibilityIdentifier).to(equal("welsh"))
          }
        }
      }
      
      context("when third cell is dequeued"){
        
        beforeEach {
          let indexPath = IndexPath(row: 2, section: 0)
          cell = viewController.tableView.cellForRow(at: indexPath)
        }
        
        it("should have Exmoor as textLabel text"){
          
          if let cell = cell {
            expect(cell.textLabel!.text!).to(equal("Exmoor"))
          }
        }
        
        it("should have an image named exmoor") {
          
          if let cell = cell {
            expect(cell.imageView!.accessibilityIdentifier).to(equal("exmoor"))
          }
        }
      }
      
    }
  }
}
