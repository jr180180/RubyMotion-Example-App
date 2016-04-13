class MainViewController < UIViewController

  def init
    super
    # - (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Second', image: UIImage.imageNamed('second_view_tab_item'), tag: 1)
    self
  end

	def viewDidLoad
		self.title = 'Main'
	end

	def loadView
		self.view = MainView.new
		view.top_guide = self.topLayoutGuide
		view.view_constraints

		# - (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
		view.button.addTarget(self, action: :alert_controller, forControlEvents: UIControlEventTouchUpInside)
		view.todo_button.addTarget(self, action: :add_todo, forControlEvents: UIControlEventTouchUpInside)

    # - (instancetype)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
    right_button = UIBarButtonItem.alloc.initWithTitle('Add', style: UIBarButtonItemStylePlain, target: self, action: :add_todo)
    left_button = UIBarButtonItem.alloc.initWithTitle('Delete', style: UIBarButtonItemStylePlain, target: self, action: nil)
    self.navigationItem.setRightBarButtonItem(right_button, animated: true)
    self.navigationItem.setLeftBarButtonItem(left_button, animated: true)

		manager = AFHTTPSessionManager.new
		# - (nullable NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(nullable id)parameters progress:(nullable void ( ^ ) ( NSProgress *downloadProgress ))downloadProgress success:(nullable void ( ^ ) ( NSURLSessionDataTask *task , id _Nullable responseObject ))success failure:(nullable void ( ^ ) ( NSURLSessionDataTask *_Nullable task , NSError *error ))failure
		manager.GET('https://qrng.anu.edu.au/API/jsonI.php?length=1&type=uint8', parameters: nil, progress: nil,
								success: lambda {|task, response| p response},
								failure: lambda {|task, error| p error.localizedDescription}
		)
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

	def add_todo
		# - (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
		navigationController.pushViewController(TodoViewController.new, animated: true)
  end

end