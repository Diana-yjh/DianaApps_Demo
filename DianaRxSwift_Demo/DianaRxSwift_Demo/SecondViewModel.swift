import RxSwift

class SecondViewModel {
    func execute() {
        let observer = Observable<String>.create { observer in
            observer.onNext("1")
            observer.onNext("2")
            observer.onCompleted()
            return Disposables.create()
        }.subscribe(onNext: { data in
            print(data)
        }).dispose()
    }
}
