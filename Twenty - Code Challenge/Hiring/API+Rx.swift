import Foundation
import RxSwift

extension API: ReactiveCompatible {}

extension Reactive where Base: API {
    func fetch<T: Decodable>(request: Request) -> Observable<T> {
        return Observable.create { [weak api = self.base]  observer -> Disposable in
            guard let api = api else {
                observer.on(.completed)
                return Disposables.create()
            }

            api.fetch(request: request) { (result: Result<T>) in
                switch result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .error(let error):
                    observer.onError(error)
                }
            }

            return Disposables.create()
        }
    }
}
