import ballerina/http;

const TEST_PORT = 8290;

type Pair record {|
    int a;
    int b;
|};

type Res record {|
    int sum;
|};

service /test1 on new http:Listener(TEST_PORT) {
    isolated resource function post data(Pair pair) returns Res|error {
        int sum = pair.a + pair.b;
        return { sum };
    }
}
