class SecondView < UIView
	attr_accessor :switch, :stepper, :stepper_label, :slider, :slider_label
	def init
		super

		self.backgroundColor = UIColor.whiteColor

		# - (instancetype)initWithFrame:(CGRect)frame
		@switch = UISwitch.alloc.initWithFrame([[20, 150],[200, 30]])
		# @property(nonatomic, strong) UIColor *onTintColor
		@switch.onTintColor = UIColor.blackColor
		addSubview(@switch)

		@stepper = UIStepper.new
		@stepper.minimumValue = 0
		@stepper.maximumValue = 10
		@stepper.stepValue = 1
		@stepper.value = 0
		@stepper.frame = [[20, 200],[30,30]]
		addSubview(@stepper)

		@stepper_label = UILabel.new
		@stepper_label.text = '0'
		@stepper_label.textColor = UIColor.blackColor
		@stepper_label.frame = [[150,200],[60,30]]
		addSubview(@stepper_label)

		@slider = UISlider.new
		@slider.value = 3
		@slider.minimumValue = 0
		@slider.maximumValue = 100
		@slider.minimumValueImage = UIImage.imageNamed('volume-off')
		@slider.maximumValueImage = UIImage.imageNamed('volume-up')
		@slider.continuous = true
		@slider.frame = [[20,400],[300,30]]
		addSubview(@slider)

		@slider_label = UILabel.new
		@slider_label.text = '3'
		@slider_label.textColor = UIColor.blackColor
		@slider_label.frame = [[150,450],[60,30]]
		addSubview(@slider_label)

		self
	end
end