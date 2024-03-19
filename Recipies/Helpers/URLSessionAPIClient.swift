//
//  URLSessionAPIClient.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/18/24.
//
import Foundation
import Combine

class URLSessionAPIClient<EndpointType: APIEndpoint> : APIClient { // TODO: Check if we can use struct instead
    func request<T>(_ endpoint: EndpointType) -> AnyPublisher<T, any Error> where T : Decodable {
        //process query parameters
        var queryItems = [URLQueryItem]()
        endpoint.parameters?.forEach { queryItems.append(URLQueryItem(name: $0, value: ($1 as? LosslessStringConvertible)?.description)) }
        
        // make URL with parameters
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path).appending(queryItems: queryItems)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
