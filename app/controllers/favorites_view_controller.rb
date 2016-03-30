class FavoritesViewController < UIViewController
  def init
    super

    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemFavorites, tag: 2)

    self
  end
	def viewDidLoad
		self.title = 'Favorites'
	end

	def loadView
		self.view = UIView.new
		view.backgroundColor = UIColor.greenColor

		label = UILabel.new
		label.textColor = UIColor.blackColor
		label.frame = [[20, 200],[280, 30]]
		label.text = 'This is the Favorites Controller'
		view.addSubview(label)

	end

end