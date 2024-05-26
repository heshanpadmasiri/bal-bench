import ballerina/time;
import ballerina/io;
function generateValues(int n) returns int[] {
    return from int i in 1...n select i;
}


function intLoop(int[] values) returns int {
    int sum = 0;
    int len = values.length();
    foreach int i in  0..<len {
        sum += values[i];
    }
    return sum;
}

public function main() {
    int[] values = generateValues(100000);
    decimal startTime = time:monotonicNow();
    int sum = intLoop(values);
    decimal time = time:monotonicNow() - startTime;
    io:println(time); // seconds
}
