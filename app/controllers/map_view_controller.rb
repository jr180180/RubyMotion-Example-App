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
    get_location
  end

  def get_location
    if CLLocationManager.locationServicesEnabled
      @location_manager = CLLocationManager.new
      @location_manager.delegate = self
      @location_manager.requestAlwaysAuthorization
      @location_manager.desiredAccuracy = KCLLocationAccuracyNearestTenMeters
      @location_manager.distanceFilter = 25.0
      @location_manager.startUpdatingLocation
    end
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

  # - (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
  def locationManager(locationManager, didUpdateLocations: locations)
    # puts "Location coordinate = #{locations}"
    puts "Latitude = #{locations.first.coordinate.latitude}"
    puts "Longitude = #{locations.first.coordinate.longitude}"
  end
end