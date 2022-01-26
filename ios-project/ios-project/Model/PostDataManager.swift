//
//  postDataManager.swift
//  ios-project
//
//  Created by Ayris Gürbulak on 26.01.2022.
//

import Foundation

struct PostDataManager {
    
    func fetchPostData(completion: @escaping (PostData) ->Void) {
        
        if let url = URL(string: C.redditUrl) {
                    
                    let session = URLSession(configuration: .default)
                    
                    let task = session.dataTask(with: url) { data, response, error in
                        if error != nil {
                            print(error!)
                            return
                        }
                        
                        if let safeData = data {
                            
                            if let posts = parseJSON(safeData) {
                                completion(posts)
                            }
                        }
                    }
                    
                    task.resume()
            }
    }
    
    func parseJSON(_ posts: Data) -> PostData? {
        
        let decoder = JSONDecoder()
                
                do {
                    let posts = try decoder.decode(PostData.self, from: posts)
                    
                    return posts
                    
                } catch {
                    print(error)
                    return nil
                }
    }
        
}
