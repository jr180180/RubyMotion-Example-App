class TodoViewController < UIViewController
	def viewDidLoad
		self.title = 'Add A Todo'
	end

	def loadView
		self.view = UIView.new
		view.backgroundColor = UIColor.orangeColor
		label = UILabel.new
		label.textColor = UIColor.blackColor
		label.frame = [[20, 200],[280, 30]]
		label.text = 'You can add a To-Do here.'
		view.addSubview(label)
	end
end