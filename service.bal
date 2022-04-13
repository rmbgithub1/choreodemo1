
import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9090`.
service /test on new http:Listener(9090) {

    resource function get users/[string urlparam1](string targeturl) returns json|error {

        http:Client httpEndpoint = check new (targeturl);
        json getResponse = check httpEndpoint->get("/public/v2/users");
        log:printInfo("END - get users result: " + <string>getResponse);
        json result = getResponse;
        return result;
    }
}
