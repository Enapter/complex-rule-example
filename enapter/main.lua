local mod = require("enapter.main.module")

print(mod())

return function()
  return mod()
end
