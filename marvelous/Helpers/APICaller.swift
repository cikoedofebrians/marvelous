//
//  APICaller.swift
//  marvelous
//
//  Created by Ciko Edo Febrian on 27/06/23.
//

import Foundation

enum APIError: Error {
    case failedToGetData
}


struct APICaller {
    static let shared = APICaller()
    
    func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APIError.failedToGetData))
                return
            }
            do {
                let results = try JSONDecoder().decode(T.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getCharactersData(offset:Int ,completion: @escaping (Result<[Character], Error>) -> Void){
        guard let url = URL(string: "\(K.marvelBaseUrl)characters\(Formatter.getHashedQuery())&limit=50&offset=\(offset)") else {return}
        fetchData(from: url) { (result: Result<CharacterResponse, Error>) in
            switch result {
            case .success(let characters):
                completion(.success(characters.data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func searchCharacters(query: String, completion: @escaping (Result<[Character], Error>) -> Void){
        guard let url = URL(string: "\(K.marvelBaseUrl)characters\(Formatter.getHashedQuery())&limit=20&nameStartsWith=\(query)") else {return}
        fetchData(from: url) { (result: Result<CharacterResponse, Error>) in
            switch result {
            case .success(let characters):
                completion(.success(characters.data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
