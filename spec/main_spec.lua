local main = require("enapter.main")

describe("main", function()
  it("should say hello", function()
    assert.are.equal("Hello from module", main())
  end)
end)
