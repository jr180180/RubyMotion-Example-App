class ContactViewController < UIViewController
  attr_accessor :first_name, :phone_number
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

    @first_name = UILabel.new
    @first_name.text = 'First Name Here'
    @first_name.frame = [[20,100],[300,30]]
    view.addSubview(@first_name)

    @phone_number = UILabel.new
    @phone_number.text = 'Phone Number Here'
    @phone_number.frame = [[20,150],[300,30]]
    view.addSubview(@phone_number)
  end

  def show_contacts
    # Contact controller code
    contacts_controller = CNContactPickerViewController.new
    contacts_controller.delegate = self
    self.presentViewController(contacts_controller, animated: true, completion: nil)
  end

  # - (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact
  def contactPicker(picker, didSelectContact: contact)
    @first_name.text = contact.givenName
    if contact.isKeyAvailable(CNContactPhoneNumbersKey)
      @phone_number.text = "#{contact.phoneNumbers.first.value.stringValue}"
      puts contact.phoneNumbers.first.value.stringValue
    end
    # - (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
    self.dismissViewControllerAnimated(true, completion: nil)
  end

  # - (void)contactPickerDidCancel:(CNContactPickerViewController *)picker
  def contactPickerDidCancel(picker)
    self.dismissViewControllerAnimated(true, completion: nil)
    puts 'Contact picker Cancelled.'
  end
end