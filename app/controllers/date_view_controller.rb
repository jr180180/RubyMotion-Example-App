class DateViewController < UIViewController
  attr_accessor :picker, :label
  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Date', image: UIImage.imageNamed('second_view_tab_item'), tag: 7)
    self
  end

  def viewDidLoad
    self.title = 'Date Picker'
  end

  def loadView
    self.view = UIView.new
    view.backgroundColor = UIColor.whiteColor
    picker_view
    label_view
    view_constraints
  end

  def picker_view
    @picker = UIDatePicker.new
    @picker.datePickerMode = UIDatePickerModeDate
    # - (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
    @picker.addTarget(self, action: :update_label, forControlEvents: UIControlEventValueChanged)
    view.addSubview(@picker)
  end

  def label_view
    @label = UILabel.new
    @label.text = 'Date Label'
    @label.textColor = UIColor.blackColor
    view.addSubview(@label)
  end

  def update_label
    format = NSDateFormatter.new
    format.dateStyle = NSDateFormatterFullStyle
    @label.text = format.stringFromDate(@picker.date)
  end

  def view_constraints
    @label.translatesAutoresizingMaskIntoConstraints = false
    @picker.translatesAutoresizingMaskIntoConstraints = false

    margin = 20

    NSLayoutConstraint.activateConstraints(
        NSLayoutConstraint.constraintsWithVisualFormat(
            '|-margin-[label]-margin-|',
            options:NSLayoutFormatDirectionLeadingToTrailing ,
            metrics: {'margin' => margin},
            views: { 'label' => @label }))

    NSLayoutConstraint.activateConstraints(
        NSLayoutConstraint.constraintsWithVisualFormat(
            '|-margin-[picker]-margin-|',
            options:NSLayoutFormatDirectionLeadingToTrailing ,
            metrics: {'margin' => margin},
            views: { 'picker' => @picker }))

    NSLayoutConstraint.activateConstraints(
        NSLayoutConstraint.constraintsWithVisualFormat(
            'V:[top_guide]-[picker]-margin-[label]',
            options:NSLayoutFormatDirectionLeadingToTrailing ,
            metrics: {'margin' => margin},
            views: { 'label' => @label, 'picker' => @picker, 'top_guide' => self.topLayoutGuide}))

  end
end