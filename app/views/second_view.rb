class SecondView < UIView
	attr_accessor :switch, :stepper, :stepper_label
	def init
		super

		self.backgroundColor = UIColor.redColor

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

		self
	end
end