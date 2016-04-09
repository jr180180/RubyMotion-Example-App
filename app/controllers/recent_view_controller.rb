class RecentViewController < UIViewController
  attr_accessor :tap ,:pinch ,:rotate ,:swipe ,:pan ,:screen_pan ,:long_press
  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemRecents, tag: 2)
    self
  end
	def viewDidLoad
		self.title = 'Gestures'
	end

	def loadView
		self.view = UIView.new
		view.backgroundColor = UIColor.orangeColor
    label
    gestures
  end

  def label
    label = UILabel.new
    label.textColor = UIColor.blackColor
    label.frame = [[20, 200],[280, 30]]
    label.text = 'This controller has some gestures in it. Try it!'
    view.addSubview(label)
  end

  def gestures
    @tap = UITapGestureRecognizer.alloc.initWithTarget(self, action: :tap_action)
    @pinch = UIPinchGestureRecognizer.alloc.initWithTarget(self, action: :pinch_action)
    @rotate = UIRotationGestureRecognizer.alloc.initWithTarget(self, action: :rotate_action)
    @swipe = UISwipeGestureRecognizer.alloc.initWithTarget(self, action: :swipe_action)
    @swipe.direction = UISwipeGestureRecognizerDirectionRight
    @pan = UIPanGestureRecognizer.alloc.initWithTarget(self, action: :pan_action)
    @screen_pan = UIScreenEdgePanGestureRecognizer.alloc.initWithTarget(self, action: :screen_pan_action)
    @screen_pan.edges = UIRectEdgeRight
    @long_press = UILongPressGestureRecognizer.alloc.initWithTarget(self, action: :long_press_action)

    view.addGestureRecognizer(@tap)
    view.addGestureRecognizer(@pinch)
    view.addGestureRecognizer(@rotate)
    view.addGestureRecognizer(@swipe)
    # view.addGestureRecognizer(@pan)
    view.addGestureRecognizer(@screen_pan)
    view.addGestureRecognizer(@long_press)
  end

  def tap_action
    puts 'tap action' if @tap.state == UIGestureRecognizerStateEnded
  end

  def pinch_action
    puts 'pinch action' if @pinch.state == UIGestureRecognizerStateEnded
  end

  def rotate_action
    puts 'rotate action' if @rotate.state == UIGestureRecognizerStateEnded
  end

  def swipe_action
    puts 'swipe action' if @swipe.state == UIGestureRecognizerStateEnded
  end

  def pan_action
    puts 'pan action' if @pan.state == UIGestureRecognizerStateEnded
  end

  def screen_pan_action
    puts 'screen action' if @screen_pan.state == UIGestureRecognizerStateEnded
  end

  def long_press_action
    puts 'long press action' if @long_press.state == UIGestureRecognizerStateEnded
  end
end