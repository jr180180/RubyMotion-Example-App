class MainView < UIView
	attr_accessor :button, :todo_button, :top_guide, :label, :field
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

		@label = UILabel.new
		@label.text = 'Text Label'
		@label.textColor = UIColor.blueColor
		addSubview(@label)

		@field = UITextField.new
		@field.text = 'This text'
		@field.placeholder = 'Text inside the field'
		@field.backgroundColor = UIColor.yellowColor
		addSubview(@field)

		self
  end

  def view_constraints
    @label.translatesAutoresizingMaskIntoConstraints = false
    @field.translatesAutoresizingMaskIntoConstraints = false
    @button.translatesAutoresizingMaskIntoConstraints = false
    @todo_button.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activateConstraints(
        NSLayoutConstraint.constraintsWithVisualFormat(
            "|-50-[label][field(==label)]-50-|",
            options:NSLayoutFormatAlignAllBaseline ,
            metrics: nil,
            views: {"label" => @label, "field" => @field}))

    NSLayoutConstraint.activateConstraints(
        NSLayoutConstraint.constraintsWithVisualFormat(
            "|-50-[button]-50-|",
            options:NSLayoutFormatDirectionLeadingToTrailing ,
            metrics: nil,
            views: {"button" => @button}))

    NSLayoutConstraint.activateConstraints(
        NSLayoutConstraint.constraintsWithVisualFormat(
            "|-50-[todo_button]-50-|",
            options:NSLayoutFormatDirectionLeadingToTrailing ,
            metrics: nil,
            views: {"todo_button" => @todo_button}))

    NSLayoutConstraint.activateConstraints(
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[top_guide]-[label]-20-[button]-20-[todo_button]",
            options:NSLayoutFormatDirectionLeadingToTrailing ,
            metrics: nil,
            views: {"label" => @label, "button" => @button, "todo_button" => @todo_button, "top_guide" => @top_guide}))

  end

end