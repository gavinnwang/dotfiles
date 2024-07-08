return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local t = ls.text_node
    ls.add_snippets('cpp', {
      s('adj', {
        t {
          'vector<vector<int>> adj;',
        },
      }),
    })
    ls.add_snippets('cpp', {
      s('graph', {
        t {
          'int n, m;',
          'cin >> n >> m;',
          'adj.assign(n, vector<int>());',
          'for (int i = 0; i < m; i++) {',
          '  int a, b;',
          '  cin >> a >> b;',
          '  a--; b--;',
          '  adj[a].push_back(b);',
          '  adj[b].push_back(a);',
          '}',
        },
      }),
    })
  end,
}
