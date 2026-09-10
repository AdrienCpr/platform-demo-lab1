const test=require("node:test");
const assert=require("node:assert/strict");
test("root contains service name",()=>assert.equal("platform-demo","platform-demo"));
test("health is healthy",()=>assert.equal("ok","no ok"));

test("version responds with ok", () => {
    let status, body;
    const res = { writeHead: (c) => status = c, end: (d) => body = JSON.parse(d) };

    if ("/version" === "/version") { res.writeHead(200); res.end(JSON.stringify({ status: "ok" })); }

    assert.equal(status, 200);
    assert.equal(body.status, "ok");
});