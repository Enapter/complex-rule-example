rockspec_format = '3.0'
package = 'enapter-rule-example'
version = 'dev-1'
source = {
  url = 'http://developers.enapter.com'
}
description = {
  summary = 'Example of a rule with complex structure for the Enapter Rules Engine',
  homepage = 'http://developers.enapter.com'
}
dependencies = {
  'lua ~> 5.3'
}
test_dependencies = {
  'busted',
  'luacov',
  'inspect',
  'amalg'
}
build = {
  type = 'builtin',
  modules = {
    ['enapter.main'] = 'enapter/main.lua'
  }
}
test = {
  type = 'busted'
}
