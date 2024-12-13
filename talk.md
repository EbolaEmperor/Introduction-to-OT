### Page 1

Good morning everyone. I'm here to introduce the theory, computation and applications of the optimal transport. It's a both traditional and novel subject. And it's really interesting.

### Page 2

Here is an overview of the optimal transport. The principal concern of OT is transporting a probability measure to another in an optimal way. Or, measuring the distance between two probability measures. 

The OT problem was first introduced by Monge when he was thinking how to move some mound of soil to other places in an optimal way. The first mathematical formulation of OT was introduced by Kantorovich in 1942. He classifies OT into 3 types, as shown in figure 1. He proves that the OT mapping can be found by maximizing a certain functional. Brenier's theorem is a landmark result in OT theory. It shows the existence, monotonicity, and uniqueness of the OT mapping with respect to the quadratic cost function between two given probability measures. Gu and his collaborators combined differential geometry, Monge-Ampère equations, and OT theory to develop a geometric variational algorithm for OT mappings, which are applied in explainable deep learning and other areas.

Here are showcased some very cool applications, such as using OT to solve mazes, using OT for 2D shape interpolation, and using OT for histogram equalization of images.

### Page 3

Let's begin with the first OT problem: the sand-moving problem. A child wants to make a pile of sand in the shape of a castle. He consumes 1 kilocalorie of energy for every meter he moves a shovel of sand in the horizontal direction. How can we minimize the total energy he consumes?

Here is a mathematical formulation. Let's denote the source shape by $f(x)$ and the target by $g(x)$. Then we need to find a **transport mapping** $T$ to minimize the equation $(1)$. And the mapping should satisfy the equation $(2)$.

### Page 4

Here's another OT problem: the allocation problem, which is a discrete problem.

There are some steel coils to be transported from warehouses to factories. The transport cost is $1 per coil and per kilometer. How to minimize the total cost?

Let's assume the $i$-th warehouse has $a_i$ coils and the $j$-th factory needs $b_i$ coils. And assume the distance between the $i$-th warehouse and the $j$-th factory is $d_{ij}$. The formulation is: find a **transport matrix** $v_{ij}$ to minimize the equation $(3)$. And the matrix should satisfy the equation $(4)$. In fact, $v_{ij}$ means how many coils are transpoted from  the $i$-th warehouse to the $j$-th factory.
