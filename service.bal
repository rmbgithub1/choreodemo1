
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service /test on new http:Listener(9090) {

    resource function get users/[string urlparam1](string targeturl) returns json|error {

    }
}
