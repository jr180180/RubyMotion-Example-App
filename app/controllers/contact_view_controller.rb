class ContactViewController < UIViewController
  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Contacts', image: UIImage.imageNamed('second_view_tab_item'), tag: 7)
    self
  end

  def loadView
    self.view = UIView.new
    view.backgroundColor = UIColor.whiteColor
    button = UIButton.new
    button.frame = [[20, 200],[300, 30]]
    # - (void)setTitle:(NSString *)title forState:(UIControlState)state
    button.setTitle('View Contacts', forState: UIControlStateNormal)
    button.setTitleColor(UIColor.blackColor, forState: UIControlStateNormal)
    button.addTarget(self, action: :show_contacts, forControlEvents: UIControlEventTouchUpInside)
    view.addSubview(button)
  end

  def show_contacts
    # Contact controller code
    contacts_controller = CNContactPickerViewController.new
    contacts_controller.delegate = self
    self.presentViewController(contacts_controller, animated: true, completion: nil)
  end
end