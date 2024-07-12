return {
  'L3MON4D3/LuaSnip',
  lazy = true,
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local extras = require 'luasnip.extras'
    local rep = extras.rep
    local fmt = require('luasnip.extras.fmt').fmt
    vim.keymap.set({ 'i', 's' }, '<C-L>', function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-H>', function()
      ls.jump(-1)
    end, { silent = true })
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
    ls.add_snippets('cpp', {
      s('dfs graph', {
        t {
          'vector<bool> vis;',
          'void dfs(int u) {',
          '  vis[u] = 1;',
          '  for (int v : adj[u]) {',
          '    if (!vis[v]) {',
          '      dfs(v);',
          '    }',
          '  }',
          '}',
        },
      }),
    })
    ls.add_snippets('cpp', {
      s('dfs tree', {
        t {
          'void dfs(int u, int p = -1) {',
          '  for (int v : adj[u]) {',
          '    if (v == p) continue;',
          '    dfs(v, u);',
          '  }',
          '}',
        },
      }),
    })
    ls.add_snippets('cpp', {
      s('vv', {
        t {
          'vector<int> v(n);',
          'for (int i = 0; i < n; i++) {',
          '  cin >> v[i];',
          '}',
        },
      }),
    })
    ls.add_snippets('cpp', {
      s('vn', {
        t {
          'int n;',
          'cin >> n;',
          'vector<int> v(n);',
          'for (int i = 0; i < n; i++) {',
          '  cin >> v[i];',
          '}',
        },
      }),
      ls.add_snippets('cpp', {
        s(
          'in1',
          fmt(
            [[
int {};
cin >> {};
]],
            { i(1), rep(1) }
          )
        ),
        ls.add_snippets('cpp', {
          s(
            'in2',
            fmt(
              [[
int {}, {};
cin >> {} >> {};
]],
              { i(1), i(2), rep(1), rep(2) }
            )
          ),
        }),
      }),
    })
    ls.add_snippets('cpp', {
      s(
        'in3',
        fmt(
          [[
int {}, {}, {};
cin >> {} >> {} >> {};
]],
          { i(1), i(2), i(3), rep(1), rep(2), rep(3) }
        )
      ),
    })
    ls.add_snippets('cpp', {
      s('dsu', {
        t {
          'struct DSU {',
          '  vector<int> sz;',
          '  vector<int> pa;',
          '  DSU(int size) : sz(size, 1), pa(size) {',
          '    for (int i = 0; i < size; i++) {',
          '      pa[i] = i;',
          '    }',
          '  };',
          '  int find(int x) { return pa[x] == x ? x : (pa[x] = find(pa[x])); }',
          '  bool unite(int x, int y) {',
          '    int xp = find(x);',
          '    int yp = find(y);',
          '    if (xp == yp) return false;',
          '    if (sz[xp] < sz[yp]) swap(xp, yp);',
          '    sz[xp] += sz[yp];',
          '    pa[yp] = xp;',
          '    return true;',
          '  }',
          '};',
        },
      }),
    })
    ls.add_snippets('cpp', {
      s('ar', {
        t 'array<int, ',
        i(1),
        t '> ',
        i(2),
      }),
    })
  end,
}
