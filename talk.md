### Page 1

Good morning everyone. I'm glad to be here.

Well, as we know, the shortest path principle guides most decisions in life and sciences: When a commodity, a person or a single bit of information is available at a given point and needs to be sent at a target point, one should favor using the least possible effort. This is typically reached by moving an item along a straight line when in the plane or along geodesic curves in more involved metric spaces. The theory of optimal transport generalizes that intuition in the case where, instead of moving only one item at a time, one is concerned with the problem of moving simultaneously several items from one configuration onto another. Transportation, be it of people, commodities or information, very rarely involves moving only one item. All major economic problems, in logistics, production planning or network routing, involve moving distributions, and that thread appears in all of the seminal references on optimal transport.

And this is what we're going to discuss today. The theory, computation and applications of optimal transport.

### Page 2

Here is an overview of the optimal transport. The **principal concern** of OT is transporting a probability measure to another in an optimal way. Or, measuring the distance between two probability measures. 

The OT problem was first introduced by **Monge** when he was thinking how to move some mound of soil to other places in an optimal way. The first mathematical formulation of OT was introduced by **Kantorovich** in 1942. He classifies OT into 3 types, as shown in figure 1. He proves that the OT mapping can be found by maximizing a certain functional. **Brenier's theorem** is a landmark result in OT theory. It shows the existence, monotonicity, and uniqueness of the OT mapping with respect to the quadratic cost function between two given probability measures. **Gu and his collaborators** combined differential geometry, Monge-Ampère equations, and OT theory to develop a geometric variational algorithm for OT mappings, which are applied in explainable deep learning and other areas.

Here are showcased some very cool applications, such as using OT to solve mazes, using OT for 2D shape interpolation, and using OT for histogram equalization of images.

### Page 3

We will first introduce some basic ideas of OT. And we won't discuss any hard proof today.

### Page 4

Let's begin with the first OT problem: the sand-moving problem. A child wants to make a pile of sand in the shape of a castle. He consumes 1 kilocalorie of energy for every meter he moves a shovel of sand in the horizontal direction. How can we minimize the total energy he consumes?

Here is a mathematical formulation. Let's denote the source shape by $f(x)$ and the target by $g(x)$. Then we need to find a **transport mapping** $T$ to minimize the equation $(1)$. And the mapping should satisfy the equation $(2)$.

### Page 5

Here's another OT problem: the allocation problem, which is a discrete problem.

There are some steel coils to be transported from warehouses to factories. The transport cost is $1 per coil and per kilometer. How to minimize the total cost?

Let's assume the $i$-th warehouse has $a_i$ coils and the $j$-th factory needs $b_i$ coils. And assume the distance between the $i$-th warehouse and the $j$-th factory is $d_{ij}$. The formulation is: find a **transport matrix** $v_{ij}$ to minimize the equation $(3)$. And the matrix should satisfy the equation $(4)$. In fact, $v_{ij}$ means how many coils are transpoted from  the $i$-th warehouse to the $j$-th factory.

### Page 6

To give a general formulation of OT, we first define the push-foward operator. Here we see the definition. Note that the push-forward operator always preserves the total mass. And here we show the push-forward operator of a discrete measure $\alpha$ by a map $T$. The sum of coefficients of red points should be equal with the sum of coefficients of blue points.

Now we can give the **Monge formulation** of OT.  We assume $\mu$ is a probability measure on $\mathcal{X}$ and $\nu$ is one on $\mathcal{Y}$. And given a cost function $c(x,y)$. Then the general formulation of OT is the equation $(6)$, where $T$ is a map from $\mathcal{X}$ to $\mathcal{Y}$ such that the push-forward of $\mu$ by $T$ is $\nu$.

We call it Monge problem since the discrete formulation was first introduced by Monge. And the map $T$ which solves the Monge problem is called the **Monge map**.

### Page 7

Here's another general formulation of OT. We first recall the three main scenarios for OT: discrete,  semidiscrete and continuous. The common point is that the source and the target could be regarded as probability measures, whatever discrete or continuous.

Still, we assume $\mu$ is a probability measure on $\mathcal{X}$ and $\nu$ is one on $\mathcal{Y}$. And given a cost function $c(x,y)$. Then the general formulation of OT is the equation $(7)$, where $\pi$ is a measure on $\mathcal{X}\times \mathcal{Y}$ whose marginals should be $\mu$ and $\nu$, as shown in the equation $(8)$. This formulation is called the **Kantorovich problem**.

In fact, the Kantorovich problem is more general than the Monge since it can formulate the multi-marginal OT problem, with just a little modification.

### Page 8

Now we assume $\mathcal{X}=\mathcal{Y}$ and the cost function $c(x,y)$ is as this form. One natural idea is that, the optimal transport cost may define a distance between probability measures on $\mathcal{X}$. And that is the first theorem says. The distance is called **$p$-Wasserstein distance**.

Of course we care about properties of the distance. For example, the convergence. In fact, we can show that the convergence in $p$-Wasserstein distance is equivalent to the weak convergence. And that is the second theorem says.

### Page 9

The Kantorovich problem is a constrained convex minimization problem, and as such, it can be naturally paired with a so-called dual problem, which is a constrained concave maximization problem. Of course the Kantorovich problem and the dual problem share the same optimal value. And the pair $(f,g)$ is called the Kantorovich potentials.

Brenier shows that, in the case $\mathcal{X}=\mathcal{Y}=\R^d$ and $c(x,y)$ is the Euclid distance, if at least one of the two input measures has a density with respect to the Lebesgue measure, then the optimal $\pi$ in the Kantorovich formulation is unique and is supported on the graph $(x,T(x))$ of a Monge map $T$. This means that $\pi$ is got by a push-forward. Furthermore, the Monge map is uniquely defined as the gradient of a convex function $\varphi$. And this convex function is related to the dual potential $f$ solving the Kantorovich dual problem. We can get $\varphi$ as shown in the equation $(13)$.

### Page 10

Now let's see some computation methods of OT. We will focus on the one dimensional space, namely the real number space. And we will show firstly how to solve OT with $L^p$ distance in some specific cases. Then we will introduce Sinkhorn's algorithm to show how to solve OT with an arbitary cost function in discrete case.

### Page 11

Here we suppose two discrete measures in the real number space, and each with ordered supports. With the $L^p$ distance as the cost function, the OT problem is namely the $p$-Wasserstein distance. And it can be simply computed by the equation $(14)$.

In fact, it's a greedy algorithm. As the figure shows, we fill the reds with blues. Consider the blues one by one from left to right. For each blue, choose the left-most red which is not full to fill in.

### Page 12

Here's another specific case. We suppose two continuous measures in the real number space, each with a density function. We write their cummulative distribution functions as $\mathcal{C}_\mu$ and $\mathcal{C}_\nu$. Then the one-Wasserstein distance could be simply computed by the equation $(15)$. And the Monge map is then defined by the equation $(16)$.

Here we show their density functions, cumulative functions, and the Monge map. The dispacement interpolation is shown in the third figure. We can see it to understand how a probability distribution is transported to another.

Of course this method could be generalized to an arbitrary $p$-Wasserstein distance. But we don't discuss today.

### Page 13

Here's a surprising result. For 1-D Gaussians, the two-Wasserstein distance can be computed by the equation $(17)$, which is thus the Euclidean distance on the 2-D plane plotting the mean and the standard deviation of a Gaussian $\mathcal{N}(m, \sigma)$!

So there's nothing hard for us to illustrate the displacement interpolation between two 1-D Gaussians. The right figure shows the $(m,\sigma)$ plane.

### Page 14

Before we introduce the generic case in 1-D space, we firstly write all measures into discrete forms. That is, for a continuous measure with density. Suppose it supports on $[0,1]$ without loss of generality. We choose an uniform grid on the interval $[0,1]$. And define a discrete measure as the equation $(18)$. Clearly, we can approximate the measure $\mu$ with this discrete measure. And the approximation gets better and better when the grid be finer and finer.

Now for an arnitary cost matrix $C$, we can write the Kantorovich problem as the equation $(20)$, where the transport matrix $P$ satisfies marginal conditions in the equation $(21)$.

### Page 15

Now let's introduce the idea of entropy regularization.

Define the entropy function as the equation $(22)$. Then the regularized Kantorovich problem is defined by the equation $(23)$. It is in fact the original Kantorovich problem that added with a small entropy.

The figures show the graphs of optimal $P$s when choose different $\varepsilon$. The red plot is the density of original measure $\mu$ while the blue is the target. The cost matrix is set to be $|x_i-x_j|^2$. As we can see, the optimal $P$s satisfy marginal conditions. And it converges to the solution to original Kantorovich problrm as $\varepsilon$ being small and small. It can be shown that the difference between the original problem and the regularized problem is only $O(\varepsilon)$.

### Page 16

Surprisingly, the regularized Kantorovich problem can be solved with a extremely simple iteration! It's called Sinkhorn iteration since the convergence is proved by Sinkhorn. And we can rebuild the transport matrix $P$ with the equation $(25)$.

The figures show how the iteration works. At the begining, the matrix $P$ doesn't even satisfy marginal conditions. But as the iteration runs, we can see the matrix $P$ is converging to the optimal one. 

It's a fast algorithm. Altschuler and his collaborators prove that the computational complexity is near-linear to the reciprocal of $\varepsilon$. 

However, Sinkhorn iteration suffers numerical overflow when $\varepsilon$ is too small. The reason is some elements of the matrix $K$ may be too small to be a floating point number. To avoid this, we can compute the iteration in the log-domain. We don't discuss details today.
