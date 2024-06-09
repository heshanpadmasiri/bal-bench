type I1 [1, 2, 3];

type I2 [4, 5, 6];

type I3 [7, 8, 9];

type I int[3];

class ValueGenerator {
    int i = 0;
    int MAX = 0;

    function init(int max) {
        self.MAX = max;
    }

    public isolated function next() returns I? {
        if self.i > self.MAX {
            return ();
        } else {
            self.i = self.i + 1;
            int 'start = self.i % 10;
            return ['start, 'start + 1, 'start + 2];
        }
    }
}

function test(I i) returns int {
    if i is I1 {
        return 1;
    } else if i is I2 {
        return 2;
    } else if i is I3 {
        return 3;
    } else {
        return 0;
    }
}

function singletonTypeCheckBench(int n) {
    ValueGenerator gen = new ValueGenerator(n);
    int sum = 0;
    I? c = gen.next();
    while c !is () {
        sum += test(c);
        sum = sum % 1000000;
        c = gen.next();
    }
    if sum < 0 {
        panic error("unexpected");
    }
}

public function main() {
    int n = 10000000;
    singletonTypeCheckBench(n);
}

