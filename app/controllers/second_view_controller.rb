class SecondViewController < UIViewController
	def viewDidLoad
		self.title = 'Second Controller'
	end

	def loadView
		self.view = UIView.new
		view.backgroundColor = UIColor.redColor
	end
end