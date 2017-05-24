

// normally optional
let x: String? = "hello"
let y: String? = nil

// normally unwrapped an optional
var unwrapped = x!

// enum implement an optional

enum Optional<Type> : ExpressibleByNilLiteral, Equatable {
    case some(Type)
    case none
    
    // init if parameter be setted to nil
    init(nilLiteral: ()) {
        self = .none
    }
    
    init() {
        self = .none
    }
    
    init (_ value: Type) {
        self = .some(value)
    }
    
    func unwrap() -> Any {
        switch self {
        case .some(let value):
            return value
        default:
            fatalError("unexpectedly found nil while unwrapping an optional value")
        }
    }
    
    
    func isNil() -> Bool {
        if self == nil {
            print(self, "this is nil")
            return true
        } else {
            print(self, "this isn't nil")
            
            return false
        }
    }
}
// implement Equatable for enum of Optional
func ==<T>(lhs: Optional<T>, rhs: Optional<T>) -> Bool {
    switch (lhs,rhs) {
    case (.some(let _), .some(let _)):
        return true
    case (.none, .none):
        return true
        
    default:
        return false
    }
}


// custom operator >! like ! to implement unwrap optional function

postfix operator >! {}

postfix func >! <T>(value: Optional<T>) -> Any {
    return value.unwrap()
}


// demostration

let myOptionalString = Optional<String>.some("Hello")
var myOptionalnone = Optional<String>.none

var myOptionalInferInt = Optional(123)
var myOptionalInt = Optional<Int>() //it's nil



//using ExpressibleByNilLiteral protocol
myOptionalnone = nil

// nil
myOptionalnone.isNil()
myOptionalInt.isNil()



//not nil
myOptionalString.isNil() // it isn't nil



// enum unwrapped an optional
// for not nil situation
myOptionalString.unwrap() //by function
myOptionalString>!        //by custmized operator





//for nil situation

////     myOptionalnone>!
////     report error, App crash


