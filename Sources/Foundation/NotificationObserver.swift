// Created by Kai Engelhardt on 31.01.18.

import Foundation

/// This class is based on Jared Sinclairs [tweet](https://twitter.com/jaredsinclair/status/951536021459619840).
public class NotificationObserver {
	
	private var observers: [NSObjectProtocol] = []
	private let notificationCenter: NotificationCenter
	private let queue: OperationQueue
	
	public init(notificationCenter: NotificationCenter = .default, queue: OperationQueue = .main) {
		self.notificationCenter = notificationCenter
		self.queue = queue
	}
	
	deinit {
		for observer in observers {
			notificationCenter.removeObserver(observer)
		}
	}
	
	/// Adds an entry to the notification center's dispatch table that includes a notification name and a block to add to the queue.
	/// All observers will be removed when the `NotificationObserver` is released.
	///
	/// - Parameters:
	///   - name: The notification name.
	///   - handler: The block to be executed when the notification is received.
	public func when(_ name: Notification.Name, perform handler: @escaping (Notification) -> Void) {
		let observer = notificationCenter.addObserver(forName: name, object: nil, queue: queue, using: handler)
		observers.append(observer)
	}
	
}
