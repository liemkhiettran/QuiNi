import Quick
import Nimble

@testable import QuiNi

class AppIntroViewControllerSpec: QuickSpec {
  override func spec() {
    
    var viewController: AppIntroViewController!
    let userDefaults = UserDefaults.standard
    
    describe("dismissButtonTapped"){
      
      context("when it recevies a touch"){
        
        var tapHandlerTriggered: Bool!
        
        beforeEach {
          let storyboard = UIStoryboard(name: "Main", bundle:Bundle.main)
          viewController = storyboard.instantiateViewController(withIdentifier: "appIntroViewControllerID") as! AppIntroViewController
          
          let rootViewController = UIApplication.shared.keyWindow!.rootViewController!
          
          if rootViewController.presentedViewController != nil {
            // Setting to true to avoid the app intro to be presented again
            userDefaults.set(true, forKey: "appIntroHasBeenPresented")
            waitUntil { done in
              rootViewController.dismiss(animated: false){
                done()
              }
            }
          }
          
          waitUntil { done in
            rootViewController.present(viewController, animated: false){
              done()
            }
          }
          
          userDefaults.set(false, forKey: "appIntroHasBeenPresented")
          
          viewController.dismissButtonTapHandler = {
            tapHandlerTriggered = true
          }
          
          if let button = viewController.dismissButton {
            
            button.sendActions(for: .touchUpInside)
          }
        }
        
        afterEach {
          tapHandlerTriggered = false
          userDefaults.set(false, forKey: "appIntroHasBeenPresented")
          let rootViewController = UIApplication.shared.keyWindow!.rootViewController!
          waitUntil { done in
            rootViewController.dismiss(animated: false){
              done()
            }
          }
        }
        
        it("should call the dimiss tap handler"){
          expect(tapHandlerTriggered).to(beTrue())
        }
      }
    }
  }
}
