//
//  Promisable.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/26/21.
//

import Foundation

typealias PromiseAction = (Data?, URLResponse?, Error?) -> Void
typealias DataAction = (Data) -> Void
public typealias DictionaryAction = ([String: Any]) -> Void
public typealias StringAction = (String) -> Void
typealias ErrorHandler = (Error) -> Void

extension URL: Promisable {
    func session(_ promiseAction: @escaping PromiseAction) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: self, completionHandler: promiseAction)
    }
}

extension URLRequest: Promisable {
    func session(_ promiseAction: @escaping PromiseAction) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: self, completionHandler: promiseAction)
    }

    var absoluteString: String {
        url?.absoluteString ?? "This request has no URL"
    }
}

protocol Promisable {

    func session(_ promiseAction: @escaping PromiseAction) -> URLSessionDataTask
    var absoluteString: String { get }
}

extension Promisable {

    func getData(_ dataAction: DataAction? = nil) {
        sessionDataTask(provideData: dataAction).resume()
    }

    func sessionDataTask(provideData: DataAction?) -> URLSessionDataTask {
        session { data, response, error in
            guard let data = data else {
                print("ERROR: data was nil for the call from: \(self), ")
                return
            }
            provideData?(data)
        }
    }


    func getJSON(_ jsonAction: DictionaryAction? = nil) {
        sessionDataTask(provideJSON: jsonAction, errorHandler: { error in
            print(error)
        }).resume()
    }


    func sessionDataTask(provideString: StringAction?) -> URLSessionDataTask {
        session { data, response, error in
            guard let data = data,
                error == nil,
                let document = String(data: data, encoding: .utf8) else {
                print("ERROR: data was nil for the call from: \(self), ")
                provideString?("")
                return
            }
            provideString?(document)
        }
    }

    func sessionDataTask(
        provideJSON: DictionaryAction?,
        errorHandler: @escaping ErrorHandler
    ) -> URLSessionDataTask {
        session {
            data, response, error in
            guard let data = data else {
                print("ERROR: data was nil for the call from: \(self), ")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    print("Warning: we were able to serialize the json but not cast it a [String: Any]...This would seem imposible without catching an error.")
                    return
                }
                provideJSON?(json)
            } catch {
                errorHandler(error)
                print(error.localizedDescription, "for url: \(self)")
                provideJSON?([:])
            }
        }
    }

    func getCodable<T: Codable>(expressive: Bool = true, _ action: @escaping (T?)->Void) {
        getData { (data) in
            guard expressive else {
                action(T(data))
                return
            }
            if let codable = T(data) {
                /// Expected to decode Decimal but found a number instead.means the value should be Bool
                action(codable)
            } else {
                /// Gateway Timeout means the server did not respond quickly enough.
                print(data, data.jsonDictionary )
                action(nil)
            }
        }
    }

    func getCodable<First: Codable, Second: Codable>(_ action: @escaping (First?, Second?)->Void) {
        getData { data in
            action(First(data), Second(data))
        }
    }
}

extension Data {
    func jsonDictionary() throws -> [String: Any] {
        guard let unwrappedJson = try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any] else {
            throw GenericError(text: "Warning: we were able to serialize the json but not cast it a [String: Any]...This would seem imposible without catching an error.")
        }
        return unwrappedJson
    }
}

public struct GenericError: Error {
    var text: String
    var errorWithoutFunc: String

    init(function: String = #function, error: Error, text: String) {
        self.errorWithoutFunc = error.localizedDescription + "\nError: " + text
        self.text = "\n" + function + "\n" + errorWithoutFunc
    }

    init(function: String = #function, text: String) {
        self.errorWithoutFunc = text
        self.text = function + "\n" + errorWithoutFunc
    }

    init(function: String = #function, error: Error) {
        self.errorWithoutFunc = error.localizedDescription
        self.text = function + "\n" + errorWithoutFunc
    }

    var localizedDescription: String {
        self.text
    }
}

extension Decodable {
    init?(_ data: Data) {
        do {
            self = try JSONDecoder().decode(Self.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}
