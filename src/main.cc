#include "lithium_http_server.hh"

int main() {

  // Define an api with one HTTP GET route.
  li::http_api api;
  api.get("/hello_world") = [&](li::http_request& request, li::http_response& response) {
    response.write("hello world.");
  };

  // Start a http server.
  li::http_serve(api, 12345);

}
