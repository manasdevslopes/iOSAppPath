//
//  Profile.swift
//  iOSAppPractice
//
//  Created by MANAS VIJAYWARGIYA on 26/08/23.
//

import SwiftUI

struct Profile: View {
  @State private var user: GitHubUser?
  var body: some View {
    VStack(spacing: 20) {
      AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
        image
          .resizable().aspectRatio(contentMode: .fit).clipShape(Circle())
      } placeholder: {
        Circle().foregroundColor(.secondary)
      }
      .frame(width: 120, height: 120)
      
      Text(user?.login ?? "Username").bold().font(.title3)
      
      Text(user?.bio ?? "Bio").padding()
      
      Spacer()
      
    }
    .padding()
    .task {
      do {
        user = try await getUser()
      } catch GHError.invalidURL {
        print("Invalid URL")
      } catch GHError.invalidResponse {
        print("Invalid Response")
      } catch GHError.invalidData {
        print("Invalid Data")
      } catch {
        print("Unexpected Error")
      }
    }
  }
  
  func getUser() async throws -> GitHubUser {
    guard let url = URL(string: "https://api.github.com/users/manasdevslopes") else { throw GHError.invalidURL }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw GHError.invalidResponse }
    
    do {
      return try JSONDecoder().decode(GitHubUser.self, from: data)
    } catch  {
      throw GHError.invalidData
    }
  }
}

struct Profile_Previews: PreviewProvider {
  static var previews: some View {
    Profile()
  }
}

// MARK: - MODEL
struct GitHubUser: Codable {
  let login: String
  let avatarUrl: String
  let bio: String
  
  enum CodingKeys: String, CodingKey {
    case login
    case avatarUrl = "avatar_url"
    case bio
  }
}

// MARK: - Custom Errors
enum GHError: Error {
  case invalidURL
  case invalidResponse
  case invalidData
}
