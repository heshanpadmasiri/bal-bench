import ballerina/time;
import ballerina/io;
function generateValues(int n) returns int[] {
    return from int i in 1...n select i;
}


function intLoop(int[] values) returns int {
    int sum = 0;
    foreach int value in  values {
        sum += value;
    }
    return sum;
}

public function main() {
    int[] values = generateValues(100000);
    decimal startTime = time:monotonicNow();
    int _ = intLoop(values);
    decimal time = time:monotonicNow() - startTime;
    io:println(time); // seconds
}
