#import "@preview/physica:0.9.5": *
#set math.equation(numbering: "(1)")
#set heading(numbering: "1.")

#show ref: it => {
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
    // Override equation references.
    link(el.location(),numbering(
      el.numbering,
      ..counter(eq).at(el.location())
    ))
  } else {
    // Other references as usual.
    it
  }
}

= A tale of position and momenta
== Summary
- _Upper branch and symmetry-breaking ansatz_. Alberto showed that in the large momenta limit the soliton coherent state centered in $r=0$ and with width $alpha$ lives on the upper branch:
  $ ket(phi_alpha (0)) = integral d k u_alpha (k) ket(k) $
  where $ket(k)$ are the most excited eigenstates. 
  The displaced soliton is given by
  $ ket(phi_alpha (r)) = e^(-i P r) ket(phi_alpha (0)) = integral d k u_alpha (k) e^(-i k r) ket(k) $
  This band expression is clearly related to the symmetry breaking ansatz $ket(S B)$:
  $ ket(S B) = integral d r e^(i K r) ket(phi_alpha (r)) = integral d k u_alpha (k) ket(k) integral d r e^(-i(k - K) r) = 2 pi u_alpha (K) ket(K) prop ket(K) $
- _Expansion on the upper branch_. Here I derive analitically an expression for the coefficients $u_(alpha)(k)$:
$ |u_alpha (k)|^2 = d_alpha (k - K) $
$ d_alpha (k) = 1/sqrt(2 pi cal(N) f_2) exp(-1/(2 f_2 cal(N))(k/alpha)^2)(1 - f_3 /(2 f_2^2 cal(N)) k/alpha + f_3 /(6 f_2^3 cal(N)^2)(k/alpha)^3) $
- _Soliton's mass_. In my thesis I expanded "semiclassically" the following averages:
  $ expectationvalue(phi(r \/2)|H|phi(-r \/2)) equiv(E_0 + i E_1 r + E_2 r^2 + ...) expectationvalue(phi(r \/2)|phi(-r \/2)) $ <energy_expansion>
  $ expectationvalue(phi(r \/2)|phi(-r \/2)) = e^(i K r)(1 - i cal(N) f_3 ((alpha r)^3)/6 + ...) exp(-f_2 cal(N)((alpha r)^2)/2) $
  The "classicality" parameter of the soliton is $cal(N) prop K^(2/3)$, where $K$ is the soliton's momentum. Following this expansion, I showed that the effective mass in the evolution is given by
  $ 1/(2 m) = -((E_1 f_3)/(alpha f_2^3 cal(N)^2) + E_2 /
alpha^2 f_2^2 cal(N)^2) $ <effective>
  I rederive this result in @thesis. In @section_new I show that the effective mass @effective obtained using the semiclassical expansion is consistent with the standard result that the effective mass is given by the second derivative of the energy dispersion.

- _Energy averages and band dispersion_. As a bonus, I get a slick way to rewrite the coefficients $E_0, E_1, E_2, dots$ in expansion @energy_expansion as a function of the band dispersion $omega(K)$:
  $ E_0 &= omega(K)\
  E_1 &= f_2 cal(N)omega'(K)alpha\
  E_2 &= - [(f_3 cal(N)(omega'(K) alpha) + f_2^2 cal(N)^2 (omega^('')(K) alpha^2))/2] $ <coefficients_band>
  This is super interesting because in my thesis I was able to compute $E_2$ only numerically. Making use of the relations @coefficients_band, here I derive an analitycal expression for $E_2$:
  $ E_2 = -((5 f_3)/(6 f_1) +(5 f_2^2)/(9 f_1^2))alpha^2 E_0 $
== What we know from my thesis <thesis>
In my thesis we take a soliton coherent state centered in zero $ket(phi(0))$ and we let it evolve.  Suppose that the evolution of this coherent state is given by a rigid diffusion onto its Goldstone's modes:
$ ket(Psi(t= 0)) = ket(phi(0)) \
ket(Psi(t)) = integral (d z)/L exp(i K z) exp(-i E_0t)ket(phi(z)) $
where the momentum of the state is $K = expectationvalue(phi(0)|P|phi(0)) = expectationvalue(phi(z)|P|phi(z)) 
$ and $E_0 = expectationvalue(phi(0)|H|phi(0))=expectationvalue(phi(z)|H|phi(z))$ is it's energy.
We introduce the energy averages
$ expectationvalue(phi(r slash 2)|H|phi(-r slash 2)) equiv E(r) expectationvalue(phi(r slash 2)|phi(-r slash 2)) $
For small enough times $delta t$, we can approximate
$ ket(Psi(delta t)) = (1- i delta t H) ket(phi(0)) $
Introducing the phase corrected overlap $cal(O)(r) = e^(-i K r) expectationvalue(phi(r slash 2)|phi(-r slash 2)) $, one can show that the Fourier transform $tilde(f)(k, t) equiv 1/sqrt(L) integral d r f(r, t) e^(i k r)$ must satisfy
$ 1/sqrt(L)tilde(f)(k, delta t) = 1+i E_0 delta t- i delta t (tilde(cal(O)E)(k))/(tilde(cal(O))(k)) $
Let $alpha$ be the width of the packet. In a semiclassical fashion, we Taylor expand
$ E(r) = E_0 (1 + i e_1 alpha r + e_2 (alpha r)^2) $
$ cal(O)(r) = (1 - i cal(N) f_3 ((alpha r)^3)/6) exp(-f_2 cal(N)((alpha r)^2)/2) $
The Fourier transforms are given by
$ alpha sqrt(L)/(sqrt(2) pi) tilde(cal(O))(k) = 1/sqrt(f_2 cal(N)) exp(-1/(2 f_2 cal(N))(k/alpha)^2)(1 + f_3 /(2 f_2^2 cal(N)) k/alpha - f_3 /(6 f_2^3 cal(N)^2)(k/alpha)^3) $
Thanks to the exponential prefactor, the relevant momenta are of the order $k lt.approx alpha sqrt(cal(N) f_2)$. This means that in the previous expansion both terms are $O(1 slash sqrt(cal(N)))$ and thus relevant. The product is given by
$ alpha sqrt(L)/(sqrt(2) pi) tilde(cal(O) E)(k) = E_0 /sqrt(f_2 cal(N)) exp(-1/(2 f_2 cal(N))(k/alpha)^2) [(1 + e_1 f_3 /(2 f_2^2 cal(N)) + e_2 /(f_2 cal(N))) \ +(f_3 /(2 f_2^2 cal(N)) - e_1 /(f_2 cal(N)) -(5 e_2 f_3)/(2 f_2^3 cal(N)^2))(k/alpha) +((e_1 f_3)/(f_2^3 cal(N)^2) + e_2 /(f_2^2 cal(N)^2))(k/alpha)^2 + \#(k/alpha)^3 + \#(k/alpha)^4 ] $
Keeping the leading terms in $O(cal(N))$ and up to $k^2$:
$ alpha sqrt(L)/(sqrt(2) pi) tilde(cal(O) E)(k) = &E_0 /sqrt(f_2 cal(N)) exp(-1/(2 f_2 cal(N))(k/alpha)^2)\
&[1 +(f_3 /(2 f_2^2 cal(N)) - e_1 /(f_2 cal(N)))(k/alpha) +((e_1 f_3)/(f_2^3 cal(N)^2) + e_2 /(f_2^2 cal(N)^2))(k/alpha)^2 ] $
Taking the ratio we get
$ (tilde(cal(O) E)(k))/(tilde(cal(O))(k)) = E_0 [1 - e_1 /(f_2 cal(N))(k/alpha) +((e_1 f_3)/(f_2^3 cal(N)^2) + e_2 /(f_2^2 cal(N)^2))(k/alpha)^2 ] $
In my thesis we showed that the velocity of the soliton is indeed given by
$ v_(s o l) = e_1 /(f_2 cal(N) alpha) $
From the previous expression we deduce the effective mass
$ 1/(2 m) = - E_0 [(e_1 f_3)/(f_2^3 cal(N)^2) + e_2 /
f_2^2 cal(N)^2 ] $

== Band dispersion <section_new>
We consider a soliton coherent state with width $alpha$ and centered in $r$:
$ ket(phi_(alpha)(r)) $
Alberto discovered numerically that these states live on the upper branch of the theory. The eigenstates of the upper branch $H ket(k) =  omega(k) ket(k)$ are normalized such that $expectationvalue(k|k') = delta(k-k')$. The energy dispersion of the upper branch is given by $omega(k)$. We start by consider the soliton coherent state centered in $r=0$:
$ ket(phi_alpha (0)) = integral d k u_alpha (k) ket(k) $
The displaced soliton is given by
$ ket(phi_alpha (r)) = e^(-i P r) ket(phi_alpha (0)) = integral d k u_alpha (k) e^(-i k r) ket(k) $
This band expression is clearly related to the symmetry breaking ansatz:
$ integral d r e^(i K r) ket(phi_alpha (r)) = integral d k u_alpha (k) ket(k) integral d r e^(-i(k - K) r) = 2 pi u_alpha (K) ket(K) prop ket(K) $
Our goal is to better understand the properties of this function $u_(alpha)(k)$ and relate it to the semiclassical expansion I did in my thesis.
Since $expectationvalue(phi_(alpha)(0)| phi_(alpha)(0)) = 1$, we know that
$ integral d k |u_(alpha)(k)|^2 = 1 $
The overlap between two displaced solitons is given by
$ O(r) = expectationvalue((phi_alpha (r \/2)|phi_alpha (-r \/2))) &= integral d k integral d k' u_alpha^* (k') u_alpha (k) e^(i k' r \/2 + i k r \/2) expectationvalue(k|k')\ &= integral d k|u_alpha (k)|^2 e^(i k r) $
This means that we can find the function  $|u_(alpha)(k)|^2$ by Fourier transforming $O(r)$:
$ |u_alpha (k)|^2 = 1/(2 pi) integral d r O(r) e^(-i k r) $
Let $K = expectationvalue(phi_(alpha)(r)|P|phi_(alpha)(r))$ be the momentum of the soliton. For the KdV soliton the overlap $O(r)$ is given by a Gaussian + a small quantum correction:
$ O(r) = e^(i K r)(1 - i cal(N) f_3 ((alpha r)^3)/6) exp(-f_2 cal(N)((alpha r)^2)/2) $
Thus, Fourier transforming we get:
$ |u_alpha (k)|^2 = d_alpha (k - K) $
$ d_alpha (k) = 1/sqrt(2 pi cal(N) f_2) exp(-1/(2 f_2 cal(N))(k/alpha)^2)(1 - f_3 /(2 f_2^2 cal(N)) k/alpha + f_3 /(6 f_2^3 cal(N)^2)(k/alpha)^3) $
Since the exponential kills momenta $k gt.approx alpha sqrt(f_2 cal(N))$,  both quantum corrections are relevant and of order $O(sqrt(N))$.
This means that $|u_(alpha)(k)|^2$ is also a gaussian, centered in $K$, with some small quantum correction. Notice that the broadening of this gaussian is due to the fact that the soliton coherent state is not an exact eigenstate of the momenta. The momenta of this distribution $d_(alpha)(k)$ are related to the following averages:
$ expectationvalue(phi_alpha (r)|(P - K)^n |phi_alpha (r)) = integral d k(k - K)^n |u_alpha (k)| = integral d k k^n d_alpha (k) $
Also notice that the Fourier transform
$ integral d k d_alpha (k) e^(i k r) &= integral d k|u_alpha (k + K)|^2 e^(i k r)\
&= e^(-i K r) integral d k|u_alpha (k)|^2 e^(i k r) = e^(-i K r) O(r) = cal(O)(r) $
corresponds to the phase corrected overlap $cal(O)(r)$.

We now consider the energy overlap
$ expectationvalue(phi_alpha (r \/2)|H|phi_alpha (-r \/2)) = integral d k omega(k)|u_alpha (k)|^2 e^(i k r) $
The idea is now to Taylor the upper band energy dispersion to second order, since the band dispersion varies slowly with respect to the distribution $d_(alpha)(k)$. Since the width of $d_(alpha)(k)$ is $approx alpha sqrt(f_2 cal(N))$, this Taylor approximation is valid if
$ omega^(''')(K)(alpha sqrt(f_2 cal(N)))^3 << omega^('')(K)(alpha sqrt(f_2 cal(N)))^2 $ <inequality>
Up to quantum corrections, the energy dispersion is a power law $omega(K) = c K^(5/3)$. Inequality @inequality translates to
$ K/(alpha sqrt(cal(N))) prop alpha/gamma >> 1 $
 which coincides with the semiclassical limit. Expanding the band dispersion around $K$ we get
$ omega(k) = omega(K) + omega'(K)(k - K) + omega^('')(K)((k - K)^2)/2 $
This means that
$ expectationvalue(phi_alpha (r \/2)|H|phi_alpha (-r \/2)) &=integral d k [omega(K) + omega'(K)(k - K) + omega^('')(K)((k - K)^2)/2]|u_alpha (k)|^2 e^(i k r)\
&=e^(i K r) integral d k [omega(K) + omega'(K) k + omega^('')(K) k^2 /2] d_alpha (k) e^(i k r)\
&=O(r) - i e^(i K r) cal(O)'(r) - e^(i K r)/2 cal(O)^('')(r) $
Up to leading order
$ E(r) &equiv (expectationvalue(phi_alpha (r \/2)|H|phi_alpha (-r \/2)))/(O(r))\
&= omega(K) + i f_2 cal(N)(omega'(K) alpha)(alpha r) - [(f_3 cal(N)(omega'(K) alpha) + f_2^2 cal(N)^2 (omega^('')(K) alpha^2))/2](alpha r)^2 $
In my work we used the following expansion for the energy averages
$ E(r) = E_0 + i E_1 r + E_2 r^2 + ... $
This means that for a coherent state living on the upper branch, with a dispersion $omega(K)$, the coefficients are given by
$ E_0 &= omega(K)\
E_1 &= f_2 cal(N)omega'(K)alpha\
E_2 &= - [(f_3 cal(N)(omega'(K) alpha) + f_2^2 cal(N)^2 (omega^('')(K) alpha^2))/2] $
Evolving the state, we also found its effective mass
$ 1/(2 m) = -((E_1 f_3)/(alpha f_2^3 cal(N)^2) + E_2 /
alpha^2 f_2^2 cal(N)^2) $
Substituting the previous expression we get that
$ 1/m = omega''(K) $
which is indeed consistent with the fact that the state lives on the upper branch.
Keeping just the classical part (a simple power law) in the band dispersion:
$ omega(K) &approx E_0 (K) equiv c K^(5 \/3)\
omega'(K) &= 5/3 (E_0(K))/K\
omega^('')(K) &= 10/9(E_0 (K))/K^2 $
Finally, using that $K = cal(N) f_1 alpha$ we get
$ E(r) = E_0 (K) [1 + i (5 f_2)/(3 f_1)(alpha r) -((5 f_3)/(6 f_1) +(5 f_2^2)/(9 f_1^2))(alpha r)^2 ] $
In my thesis we expanded the energy average as
$ E(r) = E_0 (K) [1 + i e_1 (alpha r) + e_2 (alpha r)^2 ] $
We already knew that $e_1 = (5f_2)/(3f_1)$, but we were able to find $e_2$ only numerically. Now we showed that:
$ e_2 = -((5 f_3)/(6 f_1) +(5 f_2^2)/(9 f_1^2)) $
which perfectly matches the numerical result I obtained in my thesis.


