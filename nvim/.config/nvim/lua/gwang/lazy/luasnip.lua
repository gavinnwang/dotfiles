return {
  'L3MON4D3/LuaSnip',
  lazy = true,
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    -- local t = ls.text_node
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
      s(
        'adj',
        fmt(
          [[
vector<vector<int>> adj;
]],
          {}
        )
      ),

      s(
        'graph',
        fmt(
          [[
int n, m;
cin >> n >> m;
adj.assign(n, vector<int>());
for (int i = 0; i < m; i++) {{
  int a, b;
  cin >> a >> b;
  a--; b--;
  adj[a].push_back(b);
  adj[b].push_back(a);
}}
]],
          {}
        )
      ),

      s(
        'dfs graph',
        fmt(
          [[
vector<bool> vis;
void dfs(int u) {{
  vis[u] = 1;
  for (int v : adj[u]) {{
    if (vis[v]) continue;
    dfs(v);
    {}
  }}
}}
]],
          { i(1) }
        )
      ),

      s(
        'dfs tree',
        fmt(
          [[
void dfs(int u, int p = -1) {{
  for (int v : adj[u]) {{
    if (v == p) continue;
    dfs(v, u);
    {}
  }}
}}
]],
          { i(2) }
        )
      ),

      s(
        'vv',
        fmt(
          [[
vector<int> v(n);
for (int i = 0; i < n; i++) {{
  cin >> v[i];
}}
]],
          {}
        )
      ),

      s(
        'vn',
        fmt(
          [[
int n;
cin >> n;
vector<int> v(n);
for (int i = 0; i < n; i++) {{
  cin >> v[i];
}}
]],
          {}
        )
      ),

      s(
        'in1',
        fmt(
          [[
int {};
cin >> {};
{}
]],
          { i(1), rep(1), i(2) }
        )
      ),

      s(
        'in2',
        fmt(
          [[
int {}, {};
cin >> {} >> {};
{}
]],
          { i(1), i(2), rep(1), rep(2), i(3) }
        )
      ),

      s(
        'in3',
        fmt(
          [[
int {}, {}, {};
cin >> {} >> {} >> {};
{}
]],
          { i(1), i(2), i(3), rep(1), rep(2), rep(3), i(4) }
        )
      ),

      s(
        'grid',
        fmt(
          [[
int n, m;
cin >> n >> m;
vector<vector<int>> v(n, vector<int>(m));
for (int i = 0; i < n; i++) {{
  for (int j = 0; j < m; j++) {{
    cin >> v[i][j];
  }}
}}
]],
          {}
        )
      ),

      s(
        'dsu',
        fmt(
          [[
struct DSU {{
  vector<int> sz;
  vector<int> pa;
  DSU(int size) : sz(size, 1), pa(size) {{
    for (int i = 0; i < size; i++) {{
      pa[i] = i;
    }}
  }};
  int find(int x) {{ return pa[x] == x ? x : (pa[x] = find(pa[x])); }}
  bool unite(int x, int y) {{
    int xp = find(x);
    int yp = find(y);
    if (xp == yp) return false;
    if (sz[xp] < sz[yp]) swap(xp, yp);
    sz[xp] += sz[yp];
    pa[yp] = xp;
    return true;
  }}
}};
]],
          {}
        )
      ),

      s(
        'ar',
        fmt(
          [[
array<int, {}> {};
]],
          { i(1), i(2) }
        )
      ),
    })

    ls.add_snippets('cpp', {
      s(
        'cpt',
        fmt(
          [[
#ifdef LOCAL
#else
#define debug(x...) 'jkg'
#endif

#include <bits/stdc++.h>
#define endl '\n';
using namespace std;
using ll = long long;
using pii = pair<int, int>;
constexpr ll MOD = 1e9 + 7;
constexpr int INF = 1e9;
constexpr ll LINF = 1e18;

void solve() {{
  {}
}}

int main() {{
#ifdef LOCAL
  freopen("../a.txt", "r", stdin);
#endif
  cin.tie(nullptr)->sync_with_stdio(false);

  int t;
  cin >> t;
  while (t--) solve();

  // solve();
}}
]],
          { i(1) }
        )
      ),
    })

    ls.add_snippets('cpp', {
      s(
        'cp1',
        fmt(
          [[
#ifdef LOCAL
#else
#define debug(x...) 'jkg'
#endif

#include <bits/stdc++.h>
#define endl '\n';
using namespace std;
using ll = long long;
using pii = pair<int, int>;
constexpr ll MOD = 1e9 + 7;
constexpr int INF = 1e9;
constexpr ll LINF = 1e18;

void solve() {{}}

int main() {{
#ifdef LOCAL
  freopen("../a.txt", "r", stdin);
#endif
  cin.tie(nullptr)->sync_with_stdio(false);

  // int t;
  // cin >> t;
  // while (t--) solve();

  solve();
}}
]],
          {}
        )
      ),
    })
  end,
}
