import ballerina/http;

const TEST_PORT_1 = 8290;
const TEST_PORT_2 = 8292;

type Pair record {|
    int a;
    int b;
|};
type Server1Data record {|
    Pair[] pairs;
|};

type Server1Res record {|
    int[] res;
|};

type Server2Data record {|
    int a;
    int b;
|};

type Server2Res record {|
    int res;
|};

final http:Client test2Client = check new (string `http://localhost:${TEST_PORT_2}`);

service /test1 on new http:Listener(TEST_PORT_1) {
    isolated resource function post data(Server1Data data) returns Server1Res|error {
        int[] res = [];
        foreach Pair pair in data.pairs {
            Server2Res res2 = check test2Client->/test2/data.post(pair);
            res.push(res2.res);
        }
        return { res };
    }
}


service /test2 on new http:Listener(TEST_PORT_2) {
    isolated resource function post data(Server2Data data) returns Server2Res {
        int res = data.a + data.b;
        return {res};
    }
}
