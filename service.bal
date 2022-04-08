import ballerina/log;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service /test on new http:Listener(9090) {

    resource function get users() returns json|error {

        log:printInfo("GET ALL USERS");

        http:Client httpEndpoint = check new ("https://gorest.co.in");
        json getResponse = check httpEndpoint->get("/public/v2/users");
        log:printInfo((getResponse).toString());
        return getResponse;
    }
}
