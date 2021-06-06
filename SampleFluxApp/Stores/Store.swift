//
//  Store.swift
//  SampleFluxApp
//
//  Created by Elka Belaya on 31.05.2021.
//
import Combine
typealias Reducer<State, Action> =
    (inout State, Action) -> PassthroughSubject<Action, Never>?

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State

    private let reducers: [Reducer<State, Action>]
    private var cancellables: Set<AnyCancellable> = []
    
    init(firstState: State, reducers: [Reducer<State, Action>]) {
        state = firstState
        self.reducers = reducers
    }
    
    func dispatch(action: Action) {
        self.reducers.forEach{ reducer in
            
            guard let effect = reducer(&state, action) else {
                return
            }

            effect
                //.receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &cancellables)
        }
    }
    
}


