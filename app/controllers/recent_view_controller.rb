class RecentViewController < UIViewController
  def init
    super

    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemRecents, tag: 1)

    self
  end
	def viewDidLoad
		self.title = 'Recents'
	end

	def loadView
		self.view = UIView.new
		view.backgroundColor = UIColor.orangeColor

		label = UILabel.new
		label.textColor = UIColor.blackColor
		label.frame = [[20, 200],[280, 30]]
		label.text = 'This is the Recents Controller'
		view.addSubview(label)

	end
end