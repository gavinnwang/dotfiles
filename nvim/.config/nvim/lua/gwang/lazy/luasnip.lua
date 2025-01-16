return {
  'L3MON4D3/LuaSnip',
  lazy = true,
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local i = ls.insert_node
    local extras = require 'luasnip.extras'
    local rep = extras.rep
    local fmt = require('luasnip.extras.fmt').fmt

    -- Keybindings for snippet navigation
    vim.keymap.set({ 'i', 's' }, '<C-l>', function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-h>', function()
      ls.jump(-1)
    end, { silent = true })

    -- C++ snippets
    ls.add_snippets('cpp', {
      -- Snippet for adjacency list
      s(
        'adj',
        fmt(
          [[
vector<vector<int>> adj(n + 1);
]],
          {}
        )
      ),

      -- Snippet for tree input
      s(
        'intree',
        fmt(
          [[
for (int i = 0; i < n-1; i++) {{
  int a, b;
  cin >> a >> b;
  adj[a].push_back(b);
  adj[b].push_back(a);
}}
]],
          {}
        )
      ),

      -- Snippet for graph input
      s(
        'ingraph',
        fmt(
          [[
for (int i = 0; i < m; i++) {{
  int a, b;
  cin >> a >> b;
  adj[a].push_back(b);
  adj[b].push_back(a);
}}
]],
          {}
        )
      ),

      -- Snippet for vector of pairs
      s(
        'vpi',
        fmt(
          [[
vector<pii> v(n);
for (int i = 0; i < n; i++) {{
  cin >> v[i].first >> v[i].second;
}}
]],
          {}
        )
      ),

      -- Snippet for reading a vector of integers (size n)
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

      -- Snippet for reading a vector of integers (size n+1, starting from 1)
      s(
        'vn1',
        fmt(
          [[
int n;
cin >> n;
vector<int> v(n + 1);
for (int i = 1; i <= n; i++) {{
  cin >> v[i];
}}
]],
          {}
        )
      ),

      -- Snippet for reading a vector of pairs (input format: first, second)
      s(
        'vpin',
        fmt(
          [[
int n;
cin >> n;
vpi v(n);
for (int i = 0; i < n; i++) {{
  cin >> v[i].first >> v[i].second;
}}
]],
          {}
        )
      ),

      -- Snippet for reading an integer n
      s(
        'inn',
        fmt(
          [[
int n;
cin >> n;
]],
          {}
        )
      ),

      -- Snippet for reading an integer n and integer m
      s(
        'innm',
        fmt(
          [[
int n, m;
cin >> n >> m;
]],
          {}
        )
      ),

      -- Snippet for reading one integer with a variable name
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

      -- Snippet for reading two integers
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

      -- Snippet for reading three integers
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

      -- Snippet for reading four integers
      s(
        'in4',
        fmt(
          [[
int {}, {}, {}, {};
cin >> {} >> {} >> {} >> {};
{}
]],
          { i(1), i(2), i(3), i(4), rep(1), rep(2), rep(3), rep(4), i(5) }
        )
      ),

      -- Snippet for reading a grid of strings
      s(
        'grids',
        fmt(
          [[
int n, m;
cin >> n >> m;
vector<string> v(n);
for (int i = 0; i < n; i++) {{
  cin >> v[i];
}}
]],
          {}
        )
      ),

      -- Snippet for reading a grid of integers
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

      -- DSU (Disjoint Set Union) snippet
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

      -- Snippet for creating a fixed-size array
      s(
        'ar',
        fmt(
          [[
array<int, {}>{}
]],
          { i(1), i(2) }
        )
      ),

      -- Sorting snippet
      s(
        'sor',
        fmt(
          [[
sort({}.begin(), {}.end());
{}
]],
          { i(1), rep(1), i(2) }
        )
      ),

      -- Reverse sorting snippet
      s(
        'sorr',
        fmt(
          [[
sort({}.rbegin(), {}.rend());
{}
]],
          { i(1), rep(1), i(2) }
        )
      ),

      -- Custom sorting lambda snippet
      s(
        'sortcus',
        fmt(
          [[
sort({}.begin(), {}.end(), [&](const auto& a, const auto& b) -> bool {{
  {}
}});
]],
          { i(1), rep(1), i(2) }
        )
      ),

      -- Lambda function snippet
      s(
        'lam',
        fmt(
          [[
auto {} = [&]({}) -> {} {{
  {}
}};
]],
          { i(1), i(2), i(3), i(4) }
        )
      ),

      -- Recursive lambda function snippet
      s(
        'lamrec',
        fmt(
          [[
auto {} = [&](auto {}, {}) -> void {{
  {}
}};
]],
          { i(1), rep(1), i(2), i(3) }
        )
      ),

      -- DFS (Depth First Search) recursive lambda snippet
      s(
        'dfs',
        fmt(
          [[
auto dfs = [&](auto dfs, int u, int p = -1) -> void {{
    for (int v : adj[u]) {{
      if (v == p) continue;
      dfs(dfs, v, u);
    }}
}};
]],
          {}
        )
      ),

      -- Tree info snippet (size, parent, depth)
      s(
        'info',
        fmt(
          [[
vi sz(n + 1);
vi pa(n + 1);
vi dep(n + 1);

auto info = [&](auto info, int u, int p) -> void {{
  sz[u] = 1;
  pa[u] = p;
  for (int v : adj[u]) {{
    if (v == p) continue;
    dep[v] = dep[u] + 1;
    info(info, v, u);
    sz[u] += sz[v];
  }}
}};
]],
          {}
        )
      ),

      -- Heavy-light decomposition (HLD) snippet
      s(
        'hld',
        fmt(
          [[
vi id(n + 1);
vi tp(n + 1);
int cur_id = 1;

auto hld = [&](auto hld, int u, int p, int top) -> void {{
  id[u] = cur_id++;
  tp[u] = top;
  int mx_v = -1, mx_sz = -1;
  for (int v : adj[u]) {{
    if (v == p) continue;
    if (sz[v] > mx_sz) mx_v = v, mx_sz = sz[v];
  }}
  if (mx_v == -1) return; // leaf
  hld(hld, mx_v, u, top);

  for (int v : adj[u]) {{
    if (v == p || v == mx_v) continue;
    hld(hld, v, u, v);
  }}
}};

auto path = [&](int x, int y) -> int {{
  int ret = 0;
  while (tp[x] != tp[y]) {{
    if (dep[tp[x] ] < dep[tp[y] ]) swap(x, y);
    ret += query(id[tp[x] ], id[x]);
    x = pa[tp[x] ];
  }}
  if (dep[x] > dep[y]) swap(x, y);
  ret += query(id[x], id[y]);
  return ret;
}};
]],
          {}
        )
      ),
      s(
        'usaco',
        fmt(
          [[
#ifdef LOCAL
#else
#define debug(x...) 'jkg'
#endif
#include <bits/stdc++.h>
#define endl '\n'
using namespace std;
using ll = long long;
using pii = pair<int, int>;
using vi = vector<int>;
using vvi = vector<vector<int>>;
using vpi = vector<pii>;
constexpr ll MOD = 1e9 + 7;
constexpr int INF = 1e9;
constexpr ll LINF = 1e18;
void solve() {{
  {}
}}
int main() {{
#ifdef LOCAL
  freopen("../a.txt", "r", stdin);
#else
  freopen("{}.in", "r", stdin);
  freopen("{}.out", "w", stdout);
#endif
  cin.tie(nullptr)->sync_with_stdio(false);
  solve();
}}
]],
          { i(2), i(1), rep(1) }
        )
      ),

      -- Competitive programming template for multiple test cases
      s(
        'cpt',
        fmt(
          [[
#ifdef LOCAL
#else
#define debug(x...) 'jkg'
#endif
#include <bits/stdc++.h>
#define endl '\n'
using namespace std;
using ll = long long;
using pii = pair<int, int>;
using vi = vector<int>;
using vvi = vector<vector<int>>;
using vpi = vector<pii>;
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
  for (int i = 1; i <= t; i++) solve();
  // solve();
}}
]],
          { i(1) }
        )
      ),

      -- Simple competitive programming template
      s(
        'cp1',
        fmt(
          [[
#ifdef LOCAL
#else
#define debug(x...) 'jkg'
#endif
#include <bits/stdc++.h>
#define endl '\n'
using namespace std;
using ll = long long;
using pii = pair<int, int>;
using vi = vector<int>;
using vvi = vector<vector<int>>;
using vpi = vector<pii>;
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
  solve();
}}
]],
          { i(1) }
        )
      ),

      -- Random number generator setup
      s(
        'rng',
        fmt(
          [[
mt19937_64 rng(chrono::steady_clock::now().time_since_epoch().count());
]],
          {}
        )
      ),

      -- Power function snippet
      s(
        'pw',
        fmt(
          [[
auto pw = [&](ll a, ll b) -> ll {{
  ll r = 1;
  while (b) {{
    if (b & 1) r = (r * a) % MOD;
    b /= 2;
    a = (a * a) % MOD;
  }}
  return r;
}};
]],
          {}
        )
      ),

      -- Combinatorics snippet for nCk (choose function)
      s(
        'choose',
        fmt(
          [[
vector<ll> fac(n + 1);
fac[0] = 1;
for (int i = 1; i <= n; i++) fac[i] = (fac[i - 1] * i) % MOD;
auto C = [&](ll n, ll k) -> ll {{
  if (n < k) return 0LL;
  return (fac[n] * pw(fac[k] * fac[n - k] % MOD, MOD - 2)) % MOD;
}};
]],
          {}
        )
      ),

      -- Struct for representing a point in 2D space with cross product calculation
      s(
        'point',
        fmt(
          [[
struct P {{
  int x, y;
  void read() {{ cin >> x >> y; }}
  P operator+(const P &b) const {{ return P{{x + b.x, y + b.y}}; }}
  P operator-(const P &b) const {{ return P{{x - b.x, y - b.y}}; }}
  ll operator*(const P &b) const {{ return (ll)x * b.y - (ll)y * b.x; }}
  ll cross(const P &b, const P &c) const {{ return (b - *this) * (c - *this); }}
}};
using vp = vector<P>;
]],
          {}
        )
      ),

      -- Distance function snippet for pairs of integers
      s(
        'dist',
        fmt(
          [[
int dist(pii& x, pii& y) {{
  return (x.first - y.first) * (x.first - y.first) + (x.second - y.second) * (x.second - y.second);
}}
]],
          {}
        )
      ),
    })
  end,
}
