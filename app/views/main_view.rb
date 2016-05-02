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

  def drawRect(rect)
    # drawing_example
    # circle_example

    # line(30,400,60,350)
    # line(60,350,90,300)
    # line(90,300,120,400)
    # line(120,400,150,375)
    #
    # circles(30,400)
    # circles(60,350)
    # circles(90,300)
    # circles(120,400)
    # circles(150,375)

    # Color Declarations
    color = UIColor.colorWithRed(0.711, green: 0.162, blue: 0.162, alpha: 1)

    # Rectangle Drawing
    rectanglePath = UIBezierPath.bezierPathWithRoundedRect(CGRectMake(95, 288, 206, 70), cornerRadius: 10)
    color.setFill
    rectanglePath.fill

    # General Declarations
    context = UIGraphicsGetCurrentContext()

    # Text Drawing
    textRect = CGRectMake(90, 382, 203, 71)
    textContent = "Hello, World!"
    textStyle = NSMutableParagraphStyle.new
    textStyle.alignment = NSTextAlignmentCenter

    textFontAttributes = {
        NSFontAttributeName => UIFont.boldSystemFontOfSize(30),
        NSForegroundColorAttributeName => UIColor.blueColor,
        NSParagraphStyleAttributeName => textStyle
    }

    textTextHeight = textContent.boundingRectWithSize(
        CGSizeMake(textRect.size.width, 50),
        options: NSStringDrawingUsesLineFragmentOrigin,
        attributes: textFontAttributes,
        context: nil
    ).size.height

    CGContextSaveGState(context)
    CGContextClipToRect(context, textRect)
    textContent.drawInRect(
        CGRectMake(CGRectGetMinX(textRect),
                   CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2,
                   CGRectGetWidth(textRect), textTextHeight),
        withAttributes: textFontAttributes)
    CGContextRestoreGState(context)

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

  def drawing_example
    box = UIBezierPath.bezierPath
    box.moveToPoint(CGPointMake(100, 200))
    box.addLineToPoint(CGPointMake(150, 200))
    box.addLineToPoint(CGPointMake(150, 250))
    box.addLineToPoint(CGPointMake(100, 250))
    box.closePath
    UIColor.grayColor.setFill
    UIColor.blackColor.setStroke
    box.lineWidth = 1
    box.fill
    box.stroke

    path = UIBezierPath.bezierPath
    path.moveToPoint(CGPointMake(20, 300))
    path.addLineToPoint(CGPointMake(150, 300))
    path.addCurveToPoint(CGPointMake(150, 400), controlPoint1: CGPointMake(150,300), controlPoint2: CGPointMake(300, 350))
    path.addLineToPoint(CGPointMake(150, 500))
    path.closePath
    UIColor.redColor.setFill
    UIColor.blackColor.setStroke
    path.lineWidth = 5
    path.fill
    path.stroke
  end

  def circle_example
    # circle 1
    bounds = self.bounds
    center = CGPoint.new
    center.x = bounds.origin.x + bounds.size.width / 2.0
    center.y = bounds.origin.y + bounds.size.height / 2.0
    radius = bounds.size.width.floor / 4
    path2 = UIBezierPath.bezierPath
    path2.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: Math::PI * 0.5, clockwise: false)
    UIColor.greenColor.setStroke
    UIColor.blueColor.setFill
    path2.lineWidth = 5
    path2.closePath
    path2.stroke
    path2.fill

    # Circle 2
    center2 = CGPoint.new
    center2.x = bounds.origin.x + bounds.size.width / 2.0
    center2.y = bounds.origin.y + bounds.size.height / 2.0
    radius2 = bounds.size.width.floor / 8
    path3 = UIBezierPath.bezierPath
    path3.addArcWithCenter(center2, radius: radius2, startAngle: 0.0, endAngle: Math::PI , clockwise: false)
    UIColor.blackColor.setStroke
    UIColor.redColor.setFill
    path3.lineWidth = 10
    path3.closePath
    path3.stroke
    path3.fill
  end

  def circles(x,y)
    center = CGPoint.new
    center.x = x
    center.y = y
    radius = 10
    path = UIBezierPath.bezierPath
    path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: Math::PI * 2, clockwise: false)
    UIColor.blackColor.setStroke
    UIColor.blueColor.setFill
    path.lineWidth = 1
    path.closePath
    path.stroke
    path.fill
  end

  def line(x1,y1,x2,y2)
    line = UIBezierPath.bezierPath
    line.moveToPoint(CGPointMake(x1,y1))
    line.addLineToPoint(CGPointMake(x2,y2))
    UIColor.blackColor.setStroke
    line.lineWidth = 1
    line.stroke
  end

end