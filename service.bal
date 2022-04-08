import ballerinax/worldbank;
import ballerinax/covid19;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service /test on new http:Listener(9090) {

    resource function get stats/[string param1]/analytics(string id, int code) returns json|error? {

        covid19:Client covid19Endpoint = check new ({});
        covid19:CovidCountry statusByCountry = check covid19Endpoint->getStatusByCountry(param1);
        int totalCases = <int>statusByCountry.cases;
        worldbank:Client worldbankEndpoint = check new ({});
        worldbank:IndicatorInformation[] populationByCountry = check worldbankEndpoint->getPopulationByCountry(param1);
        int populationMillions = (populationByCountry[0]?.value ?: 0) / 1000000;
    }
}
