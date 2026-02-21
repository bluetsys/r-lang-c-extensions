void foo(int *len, double *x)
{
	int n = *len;

	int i;

	for (i = 0; i < n; i++)
		x[i] = x[i] * x[i];
}
