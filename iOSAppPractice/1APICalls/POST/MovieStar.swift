//
//  MovieStar.swift
//  iOSAppPractice
//
//  Created by MANAS VIJAYWARGIYA on 16/09/23.
//

import SwiftUI

enum UploadError: Error {
  case uploadFailed
  case decodeFailed
}

struct MovieStars: Codable {
  let name: String
  let movie: [String]
}

struct MovieStar: View {
  var body: some View {
    Button("Send Data") {
      let movies = ["Kal Ho Na Ho", "Main Hoon Naa", "Pathaan", "Jawan"]
      let iamsrk = MovieStars(name: "ShahRukh Khan", movie: movies)
      let url = URL(string: "https://reqres.in/api/users")!
      
      //        self.upload(iamsrk, to: url)
      self.upload(iamsrk, to: url) { (result: Result<MovieStars, UploadError>) in
        switch result {
          case .success(let star):
            print("Received back: \(star)")
          case .failure(let error):
            print(error)
            break
        }
      }
    }
    .tint(.green)
    .buttonStyle(.bordered)
    .buttonBorderShape(.roundedRectangle(radius: 10))
  }
  
  func upload<Input: Encodable, Output: Decodable>(_ data: Input, to url: URL, httpMethod: String = "POST", contentType: String = "application/json", completion: @escaping (Result<Output, UploadError>) -> ()) {
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod
    request.setValue(contentType, forHTTPHeaderField: "Content-Type")
    
    let encoder = JSONEncoder()
    request.httpBody = try? encoder.encode(data)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
      DispatchQueue.main.async {
        if let data {
          do {
            let decoded = try JSONDecoder().decode(Output.self, from: data)
            completion(.success(decoded))
          } catch {
            completion(.failure(.decodeFailed))
          }
        } else if error != nil {
          completion(.failure(.uploadFailed))
        } else {
          print("Unknown result: no data and no errors!")
        }
      }
    }.resume()
  }
  
  //  func upload(_ data: MovieStars, to url: URL) {
  //    let encoder = JSONEncoder()
  //
  //    var request = URLRequest(url: url)
  //    request.httpMethod = "POST"
  //    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  //    request.httpBody = try? encoder.encode(data)
  //
  //    URLSession.shared.dataTask(with: request) { data, response, error in
  //      if let data {
  //        let result = String(decoding: data, as: UTF8.self)
  //        print("result----->",result)
  //      } else if let error {
  //        print("error----->", error.localizedDescription)
  //      } else {
  //        print("Unknown result: no data and no errors!")
  //      }
  //    }.resume()
  //  }
}

struct MovieStar_Previews: PreviewProvider {
  static var previews: some View {
    MovieStar()
  }
}
