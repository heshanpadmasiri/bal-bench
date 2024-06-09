
type Value int|string|boolean;

type L1 Value[];

type L2 [Value, ListTy];

type L3 [Value, ListTy, ListTy];

type M1 record {
};

type ListTy L1|L2|L3;

type VauleTy M1|int|boolean|ListTy;

type I1 int[];

type I2 [int, Ity];

type I3 [int, Ity, Ity];

type Ity I1|I2|I3;

I1 i1 = [1, 2, 3];
I2 i2 = [1, i1];
I3 i3 = [1, i1, i1];

class ValueGenerator {
    int i = 0;
    int MAX = 0;

    function init(int max) {
        self.MAX = max;
    }

    public isolated function next() returns VauleTy? {
        if self.i > self.MAX {
            return ();
        } else {
            int index = self.i % 3;
            self.i += 1;
            if index == 0 {
                return [1, 2, 3];
            }
            else if index == 1 {
                return [1, [1, 2, 3]];
            }
            return [1, [1, 2, 3], [3, 4]];
        }
    }
}

function basicTypeCheck(VauleTy val) returns int {
    if val is L1 {
        return 1;
    }
    if val is int {
        return -1;
    }
    if val is L1 {
        return 2;
    }
    if val is map<int> {
        return -1;
    }
    return 3;
}

function singletonTypeCheck(VauleTy val) returns int {
    if val is S1 {
        return 1;
    }
    if val is Int1|Map1 {
        return -1;
    }
    if val is S2 {
        return 2;
    }
    if val is Int2 {
        return -1;
    }
    return 3;
}

type S1 [1, 2, 3];

type Int1 1;

type Map1 record {
    int a;
    int b;
};

type Int2 2;

type S2 [1, [1, 2, 3]];

type S3 [1, [1, 2, 3], [1, 2, 3]];

function singletonTypeCheckBench(int n) {
    ValueGenerator gen = new ValueGenerator(n);
    int sum = 0;
    VauleTy? c = gen.next();
    while c !is () {
        sum = singletonTypeCheck(c);
        c = gen.next();
    }
    if sum < 0 {
        panic error("unexpected");
    }
}

function basicTypeCheckBench(int n) {
    ValueGenerator gen = new ValueGenerator(n);
    int sum = 0;
    VauleTy? c = gen.next();
    while c !is () {
        sum = basicTypeCheck(c);
        c = gen.next();
    }
    if sum < 0 {
        panic error("unexpected");
    }
}

public function main() {
    int n = 10000000;
    basicTypeCheckBench(n);
    singletonTypeCheckBench(n);
}

