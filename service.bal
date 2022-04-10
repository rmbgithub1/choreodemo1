import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9090`.
service /test on new http:Listener(9090) {

    resource function get users() returns json|error {

        string url = "https://gorest.co.in";
        log:printInfo("GET ALL USERS");

        http:Client httpEndpoint = check new (url);
        json getResponse = check httpEndpoint->get("/public/v2/users");

        return getResponse;
    }
}
