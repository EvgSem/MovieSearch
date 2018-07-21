import XCTest
@testable import MovieSearch


class RestClientTests : XCTestCase {
    
    func test_SendSearchRequestShouldReturnSuccessfullResponse(){
        
        //arrange
        let request = SearchRequest(query: "Lion King", page: 1)
        
        let url = URL(string: "https://api.themoviedb.org/3/")!
        let restClient = RestClient(baseURL: url,
                                    apiKey: "d71fc1ca82e7db37f384ae1d790f07d7")
        
        let expectationItem = expectation(description: "...")
        //act
        restClient.send(request: request) { (result: RequestResult<SearchResponse>) in
            
            assert(result.response?.statusCode == 200)
            assert(result.value != nil)
            expectationItem.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    } 
}
