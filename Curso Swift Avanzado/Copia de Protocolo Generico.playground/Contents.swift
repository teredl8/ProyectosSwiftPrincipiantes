import UIKit

protocol APIRequest {
    associatedtype Response
    
    var urlRequest: URLRequest { get }
    func decodeResponse(data: Data) throws -> Response
}

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
}

enum APIRequestError: Error {
    case itemNotFound
}

func sendRequest<Request: APIRequest>(request: Request) async throws -> Request.Response{
    let (data, response) = try await URLSession.shared.data(for: request.urlRequest)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw APIRequestError.itemNotFound
    }
    
    let decodedResponse = try request.decodeResponse(data: data)
    return (decodedResponse)
}

struct PhotoInfoAPIRequest: APIRequest {
    typealias Response = PhotoInfo
    
    var apiKey: String
    
    var urlRequest: URLRequest {
        var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!; urlComponents.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        return URLRequest(url: urlComponents.url!)
    }
    
    func decodeResponse(data: Data) throws -> PhotoInfo {
        let photoInfo = try JSONDecoder().decode(PhotoInfo.self, from: data)
        return photoInfo
    }
}

let photoInfoRequest = PhotoInfoAPIRequest(apiKey: "DEMO_KEY")
Task {
    do {
        let photoInfo = try await sendRequest(request: photoInfoRequest)
        print(photoInfo)
    } catch {
        print(error)
    }
}
