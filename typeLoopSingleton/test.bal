type Value int|string|boolean;

class ValueGenerator {
    int i = 0;
    int MAX = 0;

    function init(int max) {
        self.MAX = max;
    }

    public isolated function next() returns Value? {
        if self.i > self.MAX {
            return ();
        } else {
            int index = self.i % 3;
            self.i += 1;
            if index == 0 {
                return 1;
            }
            else if index == 1 {
                return "string";
            }
            return false;
        }
    }
}

type T1 1;

type T2 2|"foo";

type T3 "string";

type T4 int|string;

function singletonTypeCheck(Value val) returns int {
    if val is T1 {
        return 1;
    }
    if val is T2 {
        return 0;
    }
    if val is T3 {
        return 2;
    }
    if val is T4 {
        return 0;
    }
    return 3;
}

function singletonTypeCheckBench(int n) {
    ValueGenerator gen = new ValueGenerator(n);
    int sum = 0;
    Value? c = gen.next();
    while c is Value {
        sum = singletonTypeCheck(c);
        c = gen.next();
    }
    if sum < 0 {
        panic error("unexpected");
    }
}

public function main() {
    singletonTypeCheckBench(100000000);
}
