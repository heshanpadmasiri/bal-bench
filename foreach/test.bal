function generateValues(int n) returns int[] {
    return from int i in 1...n select i;
}

function feLoop(int[] values) returns int {
    int sum = 0;
    foreach int item in values {
        sum += item;
    }
    return sum;
}


function intLoop(int[] values) returns int {
    int sum = 0;
    int len = values.length();
    foreach int i in  0..<len {
        sum += values[i];
    }
    return sum;
}

function whileLoop(int[] values) returns int {
    int sum = 0;
    int len = values.length();
    int i = 0;
    while (i < len) {
        sum += values[i];
        i += 1;
    }
    return sum;
}

public function main() {
    int[] values = generateValues(1000000);
    int _ = feLoop(values);
    int _ = intLoop(values);
    int _ = whileLoop(values);
}
