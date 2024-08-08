#!/usr/bin/env python3
"""An example HTTP server with GET and POST endpoints."""

from http.server import HTTPServer, BaseHTTPRequestHandler
from http import HTTPStatus
import json
import time


# Sample blog post data similar to
# https://ordina-jworks.github.io/frontend/2019/03/04/vue-with-typescript.html#4-how-to-write-your-first-component
_g_posts = {
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiJodHRwczovL21hbmFnZW1lbnQuYXp1cmUuY29tLyIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0Lzk0M2I0MjMyLTcxMGYtNGNkYi04NzYwLWI1YmYxNzc3Y2MwZS8iLCJpYXQiOjE3MjMxMjM2MjcsIm5iZiI6MTcyMzEyMzYyNywiZXhwIjoxNzIzMjEwMzI3LCJhaW8iOiJFMmRnWU1pUEYxekVybUcwS0dsbjZwcjNXKzR5QUFBPSIsImFwcGlkIjoiMmJiM2VkMGMtOTQwYy00YTNlLTlkNjktNTUzMDRlNzY1ODI3IiwiYXBwaWRhY3IiOiIyIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvOTQzYjQyMzItNzEwZi00Y2RiLTg3NjAtYjViZjE3NzdjYzBlLyIsImlkdHlwIjoiYXBwIiwib2lkIjoiMzlkNjRlYmEtODdlMS00NmRjLTgzZDUtNzYwOWEyYTVjNzA1IiwicmgiOiIwLkFUQUFNa0k3bEE5eDIweUhZTFdfRjNmTURrWklmM2tBdXRkUHVrUGF3ZmoyTUJNd0FBQS4iLCJzdWIiOiIzOWQ2NGViYS04N2UxLTQ2ZGMtODNkNS03NjA5YTJhNWM3MDUiLCJ0aWQiOiI5NDNiNDIzMi03MTBmLTRjZGItODc2MC1iNWJmMTc3N2NjMGUiLCJ1dGkiOiJVcjZPd0NHb2hVR3FrS0pjeXFnOEFBIiwidmVyIjoiMS4wIiwieG1zX2F6X3JpZCI6Ii9zdWJzY3JpcHRpb25zL2FjOTc2ZDI5LWVlODQtNDViOS1iMGUzLThlNDU5N2Y2NDNlZS9yZXNvdXJjZWdyb3Vwcy90ZXJyYWZvcm0tdGZzdGF0ZXMvcHJvdmlkZXJzL01pY3Jvc29mdC5XZWIvc2l0ZXMva2FzemViZS1mdW5jdGlvbi1hcHAiLCJ4bXNfaWRyZWwiOiI3IDE4IiwieG1zX21pcmlkIjoiL3N1YnNjcmlwdGlvbnMvYWM5NzZkMjktZWU4NC00NWI5LWIwZTMtOGU0NTk3ZjY0M2VlL3Jlc291cmNlZ3JvdXBzL3RlcnJhZm9ybS10ZnN0YXRlcy9wcm92aWRlcnMvTWljcm9zb2Z0Lk1hbmFnZWRJZGVudGl0eS91c2VyQXNzaWduZWRJZGVudGl0aWVzL3Rlc3QtdWFpIiwieG1zX3RjZHQiOjE1MzU0NDczNzh9.uLoSPB159uiKbPoBkSuKXZ4QZZBmjFH_hhzJJSs3D1QIm4lcaMQMLhOtjctL21qlAHrvFv_i7MTh6GwLVZ7zEklsV5wJKsbsTGuVAlNIBWYcYFq7n7R6nj4rVyq4jFbM-1OrT89VKAke5HRzFLAKF7dYVVbxd5ORUpBfeWJB6FlRgFUr75ci-60IBeR5CzRczvcBKifDdtC8N8IQuaiu4W31frRdqM88hKvCJ7KIQrLnxi19Zq1DMo3zotJUQec9WlvEtDNgTH-VSWy7lAw0-g7_x5aR_Ir6YQ8pxnyyFlS4uWaq-tJvmMzzBGLTl-ptJ4tw_X0Da0F4XMoAnZA7Kg",
  "client_id": "2bb3ed0c-940c-4a3e-9d69-55304e765827",
  "expires_on": "1723210326",
  "resource": "https://management.core.windows.net/",
  "token_type": "Bearer"
}



class _RequestHandler(BaseHTTPRequestHandler):
    # Borrowing from https://gist.github.com/nitaku/10d0662536f37a087e1b
    def _set_headers(self):
        self.send_response(HTTPStatus.OK.value)
        self.send_header('Content-type', 'application/json')
        # Allow requests from any origin, so CORS policies don't
        # prevent local development.
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()

    def do_GET(self):
        self._set_headers()
        self.wfile.write(json.dumps(_g_posts).encode('utf-8'))

    def do_POST(self):
        self._set_headers()
        self.wfile.write(json.dumps(_g_posts).encode('utf-8'))

    def do_OPTIONS(self):
        # Send allow-origin header for preflight POST XHRs.
        self.send_response(HTTPStatus.NO_CONTENT.value)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST')
        self.send_header('Access-Control-Allow-Headers', 'content-type')
        self.end_headers()


def run_server():
    server_address = ('', 8081)
    httpd = HTTPServer(server_address, _RequestHandler)
    print('serving at %s:%d' % server_address)
    httpd.serve_forever()


if __name__ == '__main__':
    run_server()
