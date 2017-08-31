require 'busted.runner'()

describe("a test", function()
  -- tests to here
  it("should provide some shortcuts to common functions", function()
    assert.are.unique({{ thing = 1 }, { thing = 2 }, { thing = 3 }})
  end)
end)
