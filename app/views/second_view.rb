class SecondView < UIView
	attr_accessor :switch
	def init
		super

		self.backgroundColor = UIColor.redColor

		# - (instancetype)initWithFrame:(CGRect)frame
		@switch = UISwitch.alloc.initWithFrame([[20, 150],[200, 30]])
		# @property(nonatomic, strong) UIColor *onTintColor
		@switch.onTintColor = UIColor.blackColor
		addSubview(@switch)

		self
	end
end