
;; Function main (main, funcdef_no=0, decl_uid=3174, cgraph_uid=1, symbol_order=0)

int main ()
{
  int n;
  int t;
  int i;
  int b;
  int a;
  int D.3185;

  a = 0;
  b = 1;
  i = 1;
  scanf ("%d", &n);
  printf ("%d\n", a);
  printf ("%d\n", b);
  goto <D.3182>;
  <D.3183>:
  t = b;
  b = a + b;
  printf ("%d\n", b);
  a = t;
  i = i + 1;
  <D.3182>:
  n.0_1 = n;
  if (i < n.0_1) goto <D.3183>; else goto <D.3181>;
  <D.3181>:
  D.3185 = 0;
  goto <D.3187>;
  <D.3187>:
  n = {CLOBBER(eol)};
  goto <D.3186>;
  D.3185 = 0;
  goto <D.3186>;
  <D.3186>:
  return D.3185;
}


