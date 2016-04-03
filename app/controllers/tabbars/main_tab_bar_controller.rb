class MainTabBarController < UITabBarController

  def init
    super

    self.viewControllers = [
        UINavigationController.alloc.initWithRootViewController(MainViewController.new),
        UINavigationController.alloc.initWithRootViewController(FavoritesViewController.new),
        UINavigationController.alloc.initWithRootViewController(RecentViewController.new),
        UINavigationController.alloc.initWithRootViewController(SecondViewController.new),
        UINavigationController.alloc.initWithRootViewController(TableViewController.new),
        UINavigationController.alloc.initWithRootViewController(MapViewController.new)
    ]

    self
  end

end