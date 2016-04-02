class TableViewController < UITableViewController
  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Table', image: UIImage.imageNamed('second_view_tab_item'), tag: 5)
    self
  end

  def loadView
    self.title = 'Table'
    self.tableView = UITableView.new
  #   - (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier
    tableView.registerClass(UITableViewCell, forCellReuseIdentifier: 'CELL')

  end

  # - (NSInteger)numberOfRowsInSection:(NSInteger)section
  def tableView(tableView, numberOfRowsInSection: section)
    Titles.all.count
  end

  # - (__kindofUITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    # - (__kindofUITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
    cell = tableView.dequeueReusableCellWithIdentifier('CELL', forIndexPath: indexPath)
    cell.textLabel.text = Titles.all[indexPath.row][0]
    cell.imageView.image = UIImage.imageNamed(Titles.all[indexPath.row][1])

    cell
  end
end