#include <iostream>
#include <boost/multiprecision/cpp_int.hpp>
#include <gmpxx.h>
#include <eigen3/Eigen/Dense>
#include <atcoder/modint>
#include <z3++.h>

using namespace std;
using namespace boost::multiprecision;
using namespace Eigen;
using namespace atcoder;

int main(void)
{
	cout << "Hello, World!" << endl;

	// Boostテスト
	cpp_int a = 1;
	for (int i = 1; i <= 100; i++)
	{
		a += i;
	}
	cout << a << endl;

	// GMPテスト
	mpz_class b = 1;
	for (int i = 1; i <= 100; i++)
	{
		b += i;
	}
	cout << b << endl;

	// Eigenテスト
	MatrixXd m(2, 2);
	m(0, 0) = 3;
	m(1, 0) = 2.5;
	m(0, 1) = -1;
	m(1, 1) = m(1, 0) + m(0, 1);
	cout << m << endl;

	// ac-libraryテスト
	modint1000000007 c = 1;
	for (int i = 1; i <= 100; i++)
	{
		c += i;
	}
	cout << c.val() << endl;

	// Z3テスト
	z3::context ctx;
	z3::solver s(ctx);
	z3::expr x = ctx.int_const("x");
	z3::expr y = ctx.int_const("y");
	s.add(x + y == 10);
	s.add(x > 3);
	s.add(y > 3);
	cout << s.check() << endl;

	return 0;
}
