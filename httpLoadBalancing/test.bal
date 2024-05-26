import ballerina/http;

type EgressData record {|
    int[] res;
|};

type IngressData record {|
    Query[] quries;
|};

type Query record {|
    int a;
    int b;
|};

type QueryRes record {|
    int res;
|};

const INGRESS_PORT = 8290;

int[] queryPorts = [9000, 9001, 9002];

final http:LoadBalanceClient innerClient = checkpanic new http:LoadBalanceClient({
        targets: from int port in queryPorts select { url: string `http://localhost:${port}`}
});


service /test1 on new http:Listener(INGRESS_PORT) {
    isolated resource function post data(IngressData data) returns EgressData|error {
        QueryRes[] qres = from Query query in data.quries select check innerClient->/query/data.post(query);
        int[] res = from QueryRes each in qres select each.res;
        return { res };
    }
}

service /query on new http:Listener(queryPorts[0]) {
    isolated resource function post data(Query query) returns QueryRes => queryRes(query);
}


service /query on new http:Listener(queryPorts[1]) {
    isolated resource function post data(Query query) returns QueryRes => queryRes(query);
}

service /query on new http:Listener(queryPorts[2]) {
    isolated resource function post data(Query query) returns QueryRes => queryRes(query);
}


isolated function queryRes (Query query) returns QueryRes => { res: query.a + query.b };
