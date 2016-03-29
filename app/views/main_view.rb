class MainView < UIView
	attr_accessor :button, :todo_button
	def init
		super

		self.backgroundColor = UIColor.whiteColor

		@button = UIButton.new
		# - (void)setTitle:(NSString *)title forState:(UIControlState)state
		@button.setTitle('Button Title', forState: UIControlStateNormal)
		@button.setTitle('You are pressing me!!', forState: UIControlStateHighlighted)
		# button.frame = [[x,y],[width, height]]
		# - (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
		@button.setTitleColor(UIColor.redColor, forState: UIControlStateNormal)
		@button.frame = [[20, 200], [200, 30]]
		addSubview(@button)

		# + (instancetype)buttonWithType:(UIButtonType)buttonType
		@todo_button = UIButton.buttonWithType(UIButtonTypeDetailDisclosure)
		@todo_button.setTitle('Add Todo', forState: UIControlStateNormal)
		@todo_button.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)
		@todo_button.frame = [[20, 300], [300, 30]]
		addSubview(@todo_button)

		label = UILabel.new
		label.text = 'Text Label'
		label.textColor = UIColor.blueColor
		label.frame = [[20, 150], [200, 30]]
		addSubview(label)

		field = UITextField.new
		field.text = 'This text'
		field.placeholder = 'Text inside the field'
		field.backgroundColor = UIColor.yellowColor
		field.frame = [[20, 250], [200, 30]]
		addSubview(field)

	end

end