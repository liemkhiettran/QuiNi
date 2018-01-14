import Quick
import Nimble

@testable import QuiNi

class PonyTabBarControllerSpec: QuickSpec {
  override func spec() {
    var tabBarController: PonyTabController!
    
    describe(".viewDidAppear"){
      
      context("when app intro had not been presented"){
        
        beforeEach {
          // Arrange:
          UserDefaults.standard.set(false, forKey: "appIntroHasBeenPresented")
          let storyboard = UIStoryboard(name:"Main", bundle: Bundle.main)
          tabBarController = storyboard.instantiateInitialViewController() as! PonyTabController
          
          // Act:
          UIApplication.shared.keyWindow?.rootViewController = tabBarController
        }
        
        it("should be presented"){
          // Assert:
          
          if let tabC = tabBarController,
            let presentedVC = tabC.presentedViewController {
          
            expect(presentedVC).toEventually(be(PonyTabController.self()))
          }
        }
        
        context("and dissmiss button was tapped") {
          
          let userDefaults = UserDefaults.standard
//          var appIntroViewController: AppIntroViewController?
          
          beforeEach {
            // Arrange:
            userDefaults.set(false, forKey: "appIntroHasBeenPresented")
            
            waitUntil { done in
              Thread.sleep(forTimeInterval: 0.5)
                done()
            }
           
            // Act:
            tabBarController.viewDidAppear(false)
            
            waitUntil { done in
              Thread.sleep(forTimeInterval: 0.5)
                done()
            }
            
            if let tabC = tabBarController {

              let appIntroViewController = tabC.presentedViewController as! AppIntroViewController
              appIntroViewController.dismissButton!.sendActions(for: .touchUpInside)
            }
          }
          
          it("should set appIntroHasBeenPresented to true"){
            // Assert:
            
              expect(userDefaults.bool(forKey: "appIntroHasBeenPresented")).to(beFalse())
          }
          
          it("should dismiss app intro"){
            // Assert:
            
            if let tabC = tabBarController {
            
              expect(tabC.presentedViewController).toEventually(beAKindOf(AppIntroViewController.self))
            }
          }
            
        }
      }
    }
  }
}
