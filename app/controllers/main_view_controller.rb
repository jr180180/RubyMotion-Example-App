class MainViewController < UIViewController
	def viewDidLoad
		self.title = 'Main'
	end

	def loadView
		self.view = MainView.new
		# - (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
		view.button.addTarget(self, action: :alert_controller, forControlEvents: UIControlEventTouchUpInside)
		view.todo_button.addTarget(self, action: :second_controller, forControlEvents: UIControlEventTouchUpInside)
	end

	def alert_controller
		# + (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
		@alert_controller = UIAlertController.alertControllerWithTitle(
			'Alert Title',
			message: 'This is the alert message.',
			preferredStyle: UIAlertControllerStyleAlert)
		# UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
		ok_action = UIAlertAction.actionWithTitle(
			'Ok', 
			style: UIAlertActionStyleDefault, 
			handler: Proc.new { |obj| ok_response } )
		cancel_action = UIAlertAction.actionWithTitle(
			'Cancel',
			style: UIAlertActionStyleCancel,
			handler: nil)
		# [alert addAction:defaultAction];
		@alert_controller.addAction(ok_action)
		@alert_controller.addAction(cancel_action)
		# [self presentViewController:alert animated:YES completion:nil];
		self.presentViewController(@alert_controller, animated: true, completion:nil)
	end

	def ok_response
		puts 'You pressed okay!'
	end

	def second_controller
		# - (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
		navigationController.pushViewController(SecondViewController.new, animated: true)
	end
end