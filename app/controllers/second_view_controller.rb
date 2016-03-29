class SecondViewController < UIViewController
	def viewDidLoad
		self.title = 'Second'
	end

	def loadView
		self.view = SecondView.new
		# - (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
		view.switch.addTarget(self, action: :on_action, forControlEvents: UIControlEventValueChanged)
	end

	def on_action
		if view.switch.on? 
			puts "You've switched it ON."
		else
			puts "You've switch it OFF."
		end
	end
end