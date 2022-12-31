import XCTest
@testable import app_v1

class app_v1Tests: XCTestCase {
 
    var trip1: Trip!
    var trip2: Trip!
    var trip3: Trip!
    var newElement: Element!
    var user1: User!
    let viewModel = LibraryViewModel()
    let userVM = UsersViewModel()
   // let userVM = UserViewModel()
   // let tripViewModel = TripViewModel()
    let tripRepo = TripRepository()
  let userRepo = UserRepository()
  let mtVM = MainTripsViewModel()
  let tripEleRepo = TripElementRepository()
  let eleVM = ElementsViewModel(repo: TripElementRepository())
    
  
  
  override func setUpWithError() throws {
    super.setUp()
    
    trip1 = Trip(id: "id1", name: "Grad Trip", destination: "NJ", startDate: Date.now, endDate: Date.now + 1, element: ["new"], userID: "varshaasj", imageTag: "#food")
    trip2 = Trip(id: "id3", name: "GradTrip", destination: "NY", startDate: Date.now, endDate: Date.now - 5, element: ["new"], userID: "varshaasj", imageTag: "#food")
    trip3 = Trip(id: "id6", name: "Food Trip Past", destination: "NJ Test", startDate: Date.now-4, endDate: Date.now-2, element: ["new"], userID: "varshaasj", imageTag: "#food")

    user1 = User(fname: "abc", lname: "def", email: "abc@gmail.com")
    newElement = Element(id: "testeleid", title: "Leave for hotel", elemType: "testElementType", time: Date.now-2, description: "Name of the hotel and place", day: 1, tripID: "testID", tripName: "NewTrip")
    
      // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  func testTripModel() {
    
    let newTrip = Trip(id: "testID", name: "City Trip",
                        destination: "NYC",
                       startDate: Date.now-3,
                       endDate: Date.now-1,
                       element: ["Day1:land and leave for hotel","Day2:visit the Vessel"],
                       userID: "abc",
                       imageTag: "#city")
    let testStartDate = newTrip.startDate.toString()
    let testEndDate = newTrip.endDate.toString()
    
  
    XCTAssertEqual(newTrip.name, "City Trip")
    XCTAssertEqual(newTrip.destination, "NYC")
    XCTAssertEqual(newTrip.startDate.toString(), testStartDate)
    XCTAssertEqual(newTrip.endDate.toString(), testEndDate)
    XCTAssertEqual(newTrip.element, ["Day1:land and leave for hotel","Day2:visit the Vessel"])
    XCTAssertEqual(newTrip.userID, "abc")
    XCTAssertEqual(newTrip.imageTag, "#city")
    
  }
  
  func testElementModel() {
   // let newElement = Element(id: "testeleid", title: "Leave for hotel", elemType: "testElementType", time: Date.now-2, description: "Name of the hotel and place", day: 1, tripID: "testID", tripName: "NewTrip")
    let testTime = newElement.time.toString()
    
    
    XCTAssertNotNil(newElement)
    XCTAssertEqual(newElement.title, "Leave for hotel")
    XCTAssertEqual(newElement.elemType, "testElementType")
    XCTAssertEqual(newElement.time.toString(), testTime)
    XCTAssertEqual(newElement.description, "Name of the hotel and place")
    XCTAssertEqual(newElement.day, 1)
    XCTAssertEqual(newElement.tripID, "testID")
    XCTAssertEqual(newElement.tripName, "NewTrip")
    
    eleVM.add(newElement)
    XCTAssertNotNil(tripEleRepo.retrieve())
    tripEleRepo.add(newElement)
    
    
  }
  
  func testUsers() {
    
    XCTAssertNotNil(user1)
    XCTAssertEqual(user1.fname, "abc")
    XCTAssertEqual(user1.lname, "def")
    XCTAssertEqual(user1.email, "abc@gmail.com")
    userVM.add(user1)
    XCTAssertNotNil(userRepo.get())
    //XCTAssertNotNil(mtVM.fetchCurrentUser())
    XCTAssertNotNil(mtVM.fetchCurrentUser().self)
    
    
  }

  func testTripDate() {
    let invalidTrip = Trip(id: "", name: "GradTrip", destination: "NY", startDate: Date.now, endDate: Date.now - 5, element: ["new"], userID: "varshaasj", imageTag: "#food")
    XCTAssertTrue(trip1.startDate < trip1.endDate)
    XCTAssertFalse(invalidTrip.startDate < invalidTrip.endDate)
    XCTAssertTrue(trip3.startDate < trip3.endDate)
   
    
    viewModel.add(trip1)
    viewModel.add(trip2)
    viewModel.add(trip3)
    viewModel.add(trip1)
    XCTAssertTrue(trip3.endDate < Date.now)
    XCTAssertNotNil(tripRepo.get())
    tripRepo.add(trip1)
    
    //XCTAssertNotNil()
   
    
  }
  
  func testToString() {
    let input = Date.now
      let expectedOutput = "2022-12-14"
    XCTAssertEqual(input.toString(), expectedOutput, "Date is not formatted properly")
    }
  
  func testImages() {
    //let img = UIImageAsset
    XCTAssertNotNil(UIImage.init(named: "city-trip"))
    //XCTAssertNotNil(UIImage.init(named: "roadtrip-image"))
  }
  
  
  
  /*
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
   */

}
