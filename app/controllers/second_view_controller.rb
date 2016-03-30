class SecondViewController < UIViewController
  def init
    super

    # - (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Second', image: UIImage.imageNamed('second_view_tab_item'), tag: 4)

    self
  end
	def viewDidLoad
		self.title = 'Second'
	end

	def loadView
		self.view = SecondView.new
		# - (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
		view.switch.addTarget(self, action: :on_action, forControlEvents: UIControlEventValueChanged)
		view.stepper.addTarget(self, action: :stepper_value, forControlEvents: UIControlEventValueChanged)
		view.slider.addTarget(self, action: :slider_value, forControlEvents: UIControlEventValueChanged)
	end

	def on_action
		if view.switch.on? 
			puts "You've switched it ON."
			@text_label = UILabel.new
			@text_label.text = 'This is hidden no more!'
			@text_label.frame = [[20,300],[300, 30]]
			@text_label.textColor = UIColor.blackColor
			view.addSubview(@text_label)
		else
			puts "You've switch it OFF."
			@text_label.removeFromSuperview
		end
	end

	def stepper_value
		puts view.stepper.value
		view.stepper_label.text = "#{view.stepper.value}"
	end

	def slider_value
		puts view.slider.value
		view.slider_label.text = "#{view.slider.value.to_i}"
	end

end