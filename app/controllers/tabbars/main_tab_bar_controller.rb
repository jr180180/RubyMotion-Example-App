class MainTabBarController < UITabBarController
  def init
    super
    self.viewControllers = [
        UINavigationController.alloc.initWithRootViewController(MainViewController.new),
        UINavigationController.alloc.initWithRootViewController(FavoritesViewController.new),
        UINavigationController.alloc.initWithRootViewController(RecentViewController.new),
        UINavigationController.alloc.initWithRootViewController(SecondViewController.new),
        UINavigationController.alloc.initWithRootViewController(TableViewController.new),
        UINavigationController.alloc.initWithRootViewController(MapViewController.new),
        UINavigationController.alloc.initWithRootViewController(ContactViewController.new),
        UINavigationController.alloc.initWithRootViewController(DateViewController.new)
    ]
    self
  end
end