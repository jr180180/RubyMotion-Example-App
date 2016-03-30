class MainTabBarController < UITabBarController

  def init
    super

    self.viewControllers = [
        FavoritesViewController.new,
        RecentViewController.new,
        SecondViewController.new
    ]

    self
  end

end