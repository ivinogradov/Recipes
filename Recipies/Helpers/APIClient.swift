//
//  APIClient.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/18/24.
//
import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable> (_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
