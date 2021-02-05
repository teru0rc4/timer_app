import responder

app = responder.API()

@app.route("/")
def hello_world(req, resp):
    resp.text = "Hello, World!"

@app.route("/hello/{who}")
def hello_to(req, resp, *, who):
    resp.text = f"Hello, {who}!"
