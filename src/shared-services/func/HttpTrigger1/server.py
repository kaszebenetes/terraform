#!/usr/bin/env python3
"""An example HTTP server with GET and POST endpoints."""

from http.server import HTTPServer, BaseHTTPRequestHandler
from http import HTTPStatus
import json
import time


# Sample blog post data similar to
# https://ordina-jworks.github.io/frontend/2019/03/04/vue-with-typescript.html#4-how-to-write-your-first-component
_g_posts = {
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik1HTHFqOThWTkxvWGFGZnBKQ0JwZ0I0SmFLcyIsImtpZCI6Ik1HTHFqOThWTkxvWGFGZnBKQ0JwZ0I0SmFLcyJ9.eyJhdWQiOiJodHRwczovL21hbmFnZW1lbnQuY29yZS53aW5kb3dzLm5ldC8iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC85NDNiNDIzMi03MTBmLTRjZGItODc2MC1iNWJmMTc3N2NjMGUvIiwiaWF0IjoxNzIyOTUzMjEyLCJuYmYiOjE3MjI5NTMyMTIsImV4cCI6MTcyMzAzOTkxMiwiYWlvIjoiRTJkZ1lQakFKZjdSOGJNTGEyK2w3b3c3YjNKN0FBPT0iLCJhcHBpZCI6IjJiYjNlZDBjLTk0MGMtNGEzZS05ZDY5LTU1MzA0ZTc2NTgyNyIsImFwcGlkYWNyIjoiMiIsImlkcCI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0Lzk0M2I0MjMyLTcxMGYtNGNkYi04NzYwLWI1YmYxNzc3Y2MwZS8iLCJpZHR5cCI6ImFwcCIsIm9pZCI6IjM5ZDY0ZWJhLTg3ZTEtNDZkYy04M2Q1LTc2MDlhMmE1YzcwNSIsInJoIjoiMC5BVEFBTWtJN2xBOXgyMHlIWUxXX0YzZk1Ea1pJZjNrQXV0ZFB1a1Bhd2ZqMk1CTXdBQUEuIiwic3ViIjoiMzlkNjRlYmEtODdlMS00NmRjLTgzZDUtNzYwOWEyYTVjNzA1IiwidGlkIjoiOTQzYjQyMzItNzEwZi00Y2RiLTg3NjAtYjViZjE3NzdjYzBlIiwidXRpIjoiVEtoeV9LZVVtVWVaVUplNXBJX2dBUSIsInZlciI6IjEuMCIsInhtc19hel9yaWQiOiIvc3Vic2NyaXB0aW9ucy9hYzk3NmQyOS1lZTg0LTQ1YjktYjBlMy04ZTQ1OTdmNjQzZWUvcmVzb3VyY2Vncm91cHMva2FzemViZW5ldGVzLXRmLXByb2QtcmcvcHJvdmlkZXJzL01pY3Jvc29mdC5Db21wdXRlL3ZpcnR1YWxNYWNoaW5lcy9rYXN6ZWJlbmV0ZXMtdGYtcHJvZC12bS1saW51eC1iYXN0aW9uIiwieG1zX2lkcmVsIjoiNyAxNCIsInhtc19taXJpZCI6Ii9zdWJzY3JpcHRpb25zL2FjOTc2ZDI5LWVlODQtNDViOS1iMGUzLThlNDU5N2Y2NDNlZS9yZXNvdXJjZWdyb3Vwcy90ZXJyYWZvcm0tdGZzdGF0ZXMvcHJvdmlkZXJzL01pY3Jvc29mdC5NYW5hZ2VkSWRlbnRpdHkvdXNlckFzc2lnbmVkSWRlbnRpdGllcy90ZXN0LXVhaSIsInhtc190Y2R0IjoiMTUzNTQ0NzM3OCJ9.FHfMukH8wvt4JjzBtQaa1IT4VDxuRUdnayRzcajxRW2xjtP2Wv1WK19bXtGQaEX16OJPSBvmX1_zVWgvjgdyvjs9OOzq4FrqdMJmEIO7uSmhpvYX8k0RqlR2mYcYbiMtPEAf-jYWOky7LnZp_WvbQzgTMhm78viow79LLavsDSdWkx8TciF0D3T2NuGBKtavEGWFjJRs2uwiuSIAt4sdzljZTbMJSvrdGgIRqJCduPHTyPtlaeY8tI9oxuqrskN_KUHtXtdHGg93_6N4QjQZjFgJ-9kfMWfiRo4dtIQ-GNgWLxdd4KkBtAn9JDBUIpLSnjJr6IUw1GKfnquKDKPqGw",
  "client_id": "2bb3ed0c-940c-4a3e-9d69-55304e765827",
  "expires_in": "84918",
  "expires_on": "1723039912",
  "ext_expires_in": "86399",
  "not_before": "1722953212",
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
        length = int(self.headers.get('content-length'))
        message = json.loads(self.rfile.read(length))
        message['date_ms'] = int(time.time()) * 1000
        _g_posts.append(message)
        self._set_headers()
        self.wfile.write(json.dumps({'success': True}).encode('utf-8'))

    def do_OPTIONS(self):
        # Send allow-origin header for preflight POST XHRs.
        self.send_response(HTTPStatus.NO_CONTENT.value)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST')
        self.send_header('Access-Control-Allow-Headers', 'content-type')
        self.end_headers()


def run_server():
    server_address = ('', 8001)
    httpd = HTTPServer(server_address, _RequestHandler)
    print('serving at %s:%d' % server_address)
    httpd.serve_forever()


if __name__ == '__main__':
    run_server()
