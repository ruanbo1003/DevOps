from abc import ABC
from typing import Optional, Awaitable

import tornado.ioloop
import tornado.web


class TestHandler(tornado.web.RequestHandler, ABC):
    def get(self):
        self.write("Hello, world")


class NameHandler(tornado.web.RequestHandler):
    def data_received(self, chunk: bytes) -> Optional[Awaitable[None]]:
        pass

    def get(self):
        self.write("Robert\n")


class AuthHandler(tornado.web.RequestHandler):
    def data_received(self, chunk: bytes) -> Optional[Awaitable[None]]:
        pass

    def get(self):
        self.write("Auth\n")


class LimitIpHandler(tornado.web.RequestHandler):
    def data_received(self, chunk: bytes) -> Optional[Awaitable[None]]:
        pass

    def get(self):
        self.write("Limit IP return\n")


def make_app():
    return tornado.web.Application([
        (r"/", TestHandler),
        (r"/name", NameHandler),
        (r"/lua/auth", NameHandler),
        (r"/lua/limit/ip", LimitIpHandler),
    ])


def main():
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.instance().start()


if __name__ == "__main__":
    main()
