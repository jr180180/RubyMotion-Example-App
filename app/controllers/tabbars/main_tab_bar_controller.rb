class MainTabBarController < UITabBarController

  def init
    super

    self.viewControllers = [
        SecondViewController.new,
        MainViewController.new,
        SecondViewController.new,
        MainViewController.new,
        SecondViewController.new,
        MainViewController.new
    ]

    self
  end

end