class MapViewController < UIViewController
  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Map', image: UIImage.imageNamed('second_view_tab_item'), tag: 6)
    self
  end

  def loadView
    self.title = 'Map'
    self.view = MKMapView.new
    center_austin
  end

  def center_austin
    # typedef struct { CLLocationDegrees latitude; CLLocationDegrees longitude; } CLLocationCoordinate2D;
    coordinates = CLLocationCoordinate2D.new
    coordinates.latitude = 30.2669444
    coordinates.longitude = -97.7427778

    # typedef struct { CLLocationDegrees latitudeDelta; CLLocationDegrees longitudeDelta; } MKCoordinateSpan;
    span = MKCoordinateSpan.new
    span.latitudeDelta = 0.1
    span.longitudeDelta = 0.1

    # typedef struct { CLLocationCoordinate2D center; MKCoordinateSpan span; } MKCoordinateRegion;
    region = MKCoordinateRegion.new
    region.center = coordinates
    region.span = span

    # - (void)setRegion:(MKCoordinateRegion)region animated:(BOOL)animated
    self.view.setRegion(region, animated: true)
  end
end