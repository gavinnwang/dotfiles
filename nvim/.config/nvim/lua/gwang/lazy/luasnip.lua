return {
  'L3MON4D3/LuaSnip',
  lazy = true,
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
    })
    ls.add_snippets('cpp', {
      s('nm', {
        t {
          'int n, m;',
          'cin >> n >> m;',
        },
      }),
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
  end,
}
