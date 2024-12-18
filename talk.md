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

When the cost function is chosen to be the Euclidiean distance, we can derive the dynamic formulation as the equation $(14)$. The optimization objective function represents the energy cost through the mass-transfer process. The mass and the velocity should satisfy the consercation of mass formila, namely the equation $(15)$.

The dynamic formulation provides us with a new perspective. We can use this formulation to compute intermediate results at any instant conveniently. And there are some optimization methods designed to solve the dynamic formulation with the discretilization technique.

### Page 11

Now let's see some computation methods of OT. We will first show how to solve OT in some specific 1-D cases. Then we will introduce Sinkhorn's algorithm to show how to solve OT with an arbitary cost function in discrete case.

### Page 12

Here we suppose two discrete measures in the real number space, and each with ordered supports. With the $L^p$ distance as the cost function, the OT problem is namely the $p$-Wasserstein distance. And it can be simply computed by the equation $(16)$.

In fact, it's a greedy algorithm. As the figure shows, we fill the reds with blues. Consider the blues one by one from left to right. For each blue, choose the left-most red which is not full to fill in.

### Page 13

Here's another specific case. We suppose two continuous measures in the real number space, each with a density function. We write their cummulative distribution functions as $\mathcal{C}_\mu$ and $\mathcal{C}_\nu$. Then the one-Wasserstein distance could be simply computed by the equation $(17)$. And the Monge map is then defined by the equation $(18)$.

Here we show their density functions, cumulative functions, and the Monge map. The dispacement interpolation is shown in the third figure. We can see it to understand how a probability distribution is transported to another.

Of course this method could be generalized to an arbitrary $p$-Wasserstein distance. But we don't discuss today.

### Page 14

Here's a surprising result. For 1-D Gaussians, the two-Wasserstein distance can be computed by the equation $(19)$, which is thus the Euclidean distance on the 2-D plane plotting the mean and the standard deviation of a Gaussian $\mathcal{N}(m, \sigma)$!

So there's nothing hard for us to illustrate the displacement interpolation between two 1-D Gaussians. The right figure shows the $(m,\sigma)$ plane.

### Page 15

Before we introduce the generic case in 1-D space, we firstly write all measures into discrete forms. That is, for a continuous measure with density. Suppose it supports on $[0,1]$ without loss of generality. We choose an uniform grid on the interval $[0,1]$. And define a discrete measure as the equation $(20)$. Clearly, we can approximate the measure $\mu$ with this discrete measure. And the approximation gets better and better when the grid be finer and finer. Furthermore, this discretization technique can be also used in multi-dimensional spaces.

Now for an arnitary cost matrix $C$, we can write the Kantorovich problem as the equation $(22)$, where the transport matrix $P$ satisfies marginal conditions in the equation $(23)$.

### Page 16

Now let's introduce the idea of entropy regularization.

Define the entropy function as the equation $(24)$. Then the regularized Kantorovich problem is defined by the equation $(25)$. It is in fact the original Kantorovich problem that added with a small entropy.

The figures show the graphs of optimal $P$s when choose different $\varepsilon$. The red plot is the density of original measure $\mu$ while the blue is the target. The cost matrix is set to be $|x_i-x_j|^2$. As we can see, the optimal $P$s satisfy marginal conditions. And it converges to the solution to original Kantorovich problrm as $\varepsilon$ being small and small. It can be shown that the difference between the original problem and the regularized problem is only $O(\varepsilon)$.

### Page 17

Surprisingly, the regularized Kantorovich problem can be solved with a extremely simple iteration! It's called Sinkhorn iteration since the convergence is proved by Sinkhorn. And we can rebuild the transport matrix $P$ with the equation $(27)$.

The figures show how the iteration works. At the begining, the matrix $P$ doesn't even satisfy marginal conditions. But as the iteration runs, we can see the matrix $P$ is converging to the optimal one. 

It's a fast algorithm. Altschuler and his collaborators prove that the computational complexity is near-linear with respect to the reciprocal of $\varepsilon$. 

However, Sinkhorn iteration suffers numerical overflow when $\varepsilon$ is too small. The reason is some elements of the matrix $K$ may be too small to be a floating point number. To avoid this, we can compute the iteration in the log-domain. We don't discuss details today.

### Page 18

Although the initial motivations of Monge and Kantorovitch were respectively military and economic, the optimal transport finds countless applications, both theoretical but also more concrete. For example, full seismic waveform inversion, viscous fluid dynamics, quantum chemistry, etc. OT has recently become the focus of more applied problems in data sciences, especially to solve problems in image processing and machine learning.

### Page 19

Here's a simple application in 2-D shape interpolation. 

People always enjoy smooth animations. To smoothly transform this Kunkun image into a chick image, we can use the intermediate results of optimal transport. The top row shows the effects of fading in and fading out while the second row uses optimal transport. As a comparison, the computational cost in the second row is much higher than in the first row. But clearly, its smoothness is far superior to that of the first row.

Figure 14 shows how to compute the barycenters of four 2-D shapes. Theoretically, the barycenter is the midpoint of the four shapes in the sense of Wasserstein distance. Visually, the barycenter is the result of blending the four shapes together. This idea can be used for image fusion.

### Page 20

Here's a famous problem: the color transfer problem.

The problem consists in modifying a source image $I_X$ so that its colors match the colors of a target image $I_Y$. More precisely, find a new image $I_Z$ whose geometry is as close as possible to the source image $I_X$ and whose color distribution is close to the one of the exemplar image $I_Y$. The color histogram of such an image $I_X$ can be estimated using the empirical distribution $\mu_X$. The goal of color transfer algorithms is to compute a transformation $T$ such that for all pixel $x \in \Omega$, $I_Z(x) = T (I_X(x))$, where the new empirical distribution $μ_Z$ is close or equal to $μ_Y$.

The third picture shows the result of applying $T$ to $I_X$, where $T$ is computed using the Optimal Transport framework. The second row displays the 2-D projection of the 3-D distribution of pixels $\mu_X$ and $\mu_Y$.

### Page 21

Here's another example of color transfer using the OT framework, where the image of Eiffel tower is modified to different color styles.

### Page 22

This application is from an article published in JCP. The author Bruno Lévy uses partial OT to simulate the fluid dunamics with free boundary.

His algorithm decomposes the simulated object into a set of convex cells called a Laguerre diagram, parameterized by the position of $N$ points in 3-D and $N$ additional parameters that control the volumes of the cells. These parameters are found as the unique solution of the semi-discrete Monge-Ampère equation, which is a stemming from the OT theory. In his article, this setting is extended to objects with free boundaries and arbitrary topology, evolving in a domain of arbitrary shape, by solving a partial optimal transport problem. The resulting Lagrangian scheme makes it possible to accurately control the volume of the object, while precisely computing the intersections with the domain boundary, the interactions, the collisions, and the changes of topology.

### Page 23

Zhao et al, including Xianfeng Gu, present a novel area-preservation mapping method using the optimal mass transport technique, based on the Monge-Brenier theory. Their optimal transport map approach is rigorous and solid in theory, efficient and parallel in computation, yet general for various applications. By comparison with the conventional Monge-Kantorovich approach, their method reduces the number of variables from $O(n^2)$ to $O(n)$, and converts the optimal mass transport problem to a convex optimization problem, which can then be efficiently carried out by Newton’s method. Their framework, by combining conformal mapping and optimal mass transport mapping, serves as a powerful tool for a broad range of applications in visualization and graphics, especially for medical imaging.

### Page 24

Domain adaptation is a technique in machine learning where a model trained on one type of data is adjusted to work well on another. The goal is to make the model perform well on new data, even if it was not explicitly trained on that new data. For example, firstly training with images of computers in Amazon.com, then use domain adaptation to derive another model, which can identify computers in your classroom. Domain adaptation is one of the most challenging tasks of modern data analytics.

This is a famous work which has more than 1000 citations. Flamary and Tuia propose a regularized unsupervised optimal transportation model to perform the alignment of the representations in the source and target domains. They learn a transportation plan matching both PDFs, which constrains labeled samples of the same class in the source domain to remain close during transport. This way, they exploit at the same time the labeled samples in the source and the distributions observed in both domains.

Figure 21 shows the numerical test in a toy example. The main idea is, training only in the source domain, then use the OT-based algorithm to adapt the model into the rotated domain. The method works well when the rotation angle is not too large.

### Page25

In summary, optimal transport is a mathematical framework that helps us understand the most efficient way to move resources from one place to another. It involves finding the best ‘transport plan’ that minimizes the cost, considering both the distance and the amount being moved. It has many computation methods and a wide range of applications. 

We believe that, in today's AI era, optimal transport will attract increasing attention. Perhaps one day, based on the optimal transport, people will be able to develop powerful and interpretable AI models. 

That's all. Thank you.
