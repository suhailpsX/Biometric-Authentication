//
//  ViewController.swift
//  FaceLock
//
//  Created by SUHAIL  on 22/10/22.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController
{

    @IBOutlet weak var faceIDButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        faceIDButton.layer.cornerRadius = 8.0
        faceIDButton.layer.shadowColor = UIColor.lightGray.cgColor
        faceIDButton.layer.shadowOpacity = 0.2
        faceIDButton.layer.shadowOffset = .zero
        faceIDButton.layer.shadowRadius = 2.0
        faceIDButton.layer.masksToBounds = false
        faceIDButton.layer.shadowOffset = CGSize(width: 2, height: 3)
    }

    @IBAction func faceIDAction(_ sender: Any)
    {
        faceAuth()
        print("Pressed")
    }
    
    func faceAuth()
    {
        let context = LAContext()
        var error : NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error )
        {
            let reason = "Please authorize with touch ID."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
            {
                [weak self] success , error in
                DispatchQueue.main.async {
                    guard success, error == nil else
                    {
                        //Failed
                        let alert = UIAlertController(title: "Fail to Authenticate!", message: "Please try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                        self!.present(alert, animated: true)
                        return
                    }
                    //Show other reasons.
                    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextPageViewController") as! NextPageViewController
                    self!.show(nextViewController, sender: nil)

                }
            }
        }
        else
        {
            // Cannot use
            let alert = UIAlertController(title: "Unavailable!", message: "You can't use this feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            self.present(alert, animated: true)
        }
    }
}










//extension ViewController {
//
//    func authenticationWithTouchID() {
//        let localAuthenticationContext = LAContext()
//        localAuthenticationContext.localizedFallbackTitle = "Use Passcode"
//
//        var authError: NSError?
//        let reasonString = "To access the secure data"
//
//        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
//
//            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) { success, evaluateError in
//
//                if success {
//
//                    //TODO: User authenticated successfully, take appropriate action
//
//                } else {
//                    //TODO: User did not authenticate successfully, look at error and take appropriate action
//                    guard let error = evaluateError else {
//                        return
//                    }
//
//
//                    print(error)
//                    //TODO: If you have choosen the 'Fallback authentication mechanism selected' (LAError.userFallback). Handle gracefully
//
//                }
//            }
//        } else {
//
//            guard let error = authError else {
//                return
//            }
//            //TODO: Show appropriate alert if biometry/TouchID/FaceID is lockout or not enrolled
////            print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error.code))
//            print(error)
//        }
//    }
//}
