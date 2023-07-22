//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract A {
    function foo() public pure virtual returns(string memory) {
        return "A.Foo";
    }
}

contract B is A{
    function foo() public pure virtual override returns(string memory) {
        return super.foo();
    }
}

// Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// 해결 방법: super.foo(); 앞에 return 을 붙여줌. 이벤트 호출이면 상관없는데 예시는 return string 이라서 붙여줘야 함.
contract C is A, B {
        function foo() public pure override(A, B) returns(string memory) {
            return super.foo();
        }
}

/**
 * 
pragma solidity ^0.8.17;

// Calling Parent Functions
contract E {
    // This event will be used to trace function calls.
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("F.bar");
        super.bar();
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

contract H is F, G {
    function foo() public override(F, G) {
        // Calls G.foo() and then E.foo()
        // Inside F and G, E.foo() is called. Solidity is smart enough
        // to not call E.foo() twice. Hence E.foo() is only called by G.foo().
        super.foo();
    }

    function bar() public override(F, G) {
        super.bar();
    }
}

 */