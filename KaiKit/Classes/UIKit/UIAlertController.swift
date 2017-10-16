import UIKit

extension UIAlertController {
	
	typealias Action = () -> ()
	
	static func simpleAlertWithTitle(_ title: String, message: String, action: Action? = nil) -> UIAlertController {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { alertAction in
			action?()
		}))
		return alertController
	}
	
}
