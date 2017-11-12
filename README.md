# Collisioner
任意のポリゴンモデル同士の[衝突判定](https://ja.wikipedia.org/wiki/衝突判定)を、[八分木（Octree）](https://ja.wikipedia.org/wiki/八分木)による[空間分割](https://en.wikipedia.org/wiki/Space_partitioning)によって高速化する方法。

[**[YouTube]**](https://youtu.be/Z5qbxQI6dgw) [**[Vimeo]**](https://vimeo.com/242276066)  
[![](https://media.githubusercontent.com/media/LUXOPHIA/Collisioner/movie/--------/_MOVIE/Collisioner_640x360.gif)](https://youtu.be/Z5qbxQI6dgw)

ゲームレベルで利用されるローポリゴンモデル同士の衝突判定であれば、一般的に [GJK：Gilbert-Johnson-Keerthi distance algorithm](https://en.wikipedia.org/wiki/Gilbert–Johnson–Keerthi_distance_algorithm) を用いることで容易に実装可能である。

> [![](http://capture.heartrails.com/400x300?https://graphics.stanford.edu/courses/cs448b-00-winter/papers/gilbert.pdf)](https://graphics.stanford.edu/courses/cs448b-00-winter/papers/gilbert.pdf)  
> \* [A fast procedure for computing the distance between complex objects in three-dimensional space](https://graphics.stanford.edu/courses/cs448b-00-winter/papers/gilbert.pdf)

しかし、原理的にメッシュ上を渡り歩くことで衝突位置を検索するので、CADレベルで要求される大規模なポリゴンモデルに対しては非常に効率が悪い。

> [**[SlidePlayer]**](http://slideplayer.com)  
> [![](http://slideplayer.com/slide/689954/2/images/26/Minkowski+sum+&+difference.jpg)](http://slideplayer.com/slide/689954/)  
> \* [Ericson:the GJK algorithm - Real-Time Collision Detection](http://realtimecollisiondetection.net/pubs/SIGGRAPH04_Ericson_the_GJK_algorithm.ppt)：[realtimecollisiondetection.net](http://realtimecollisiondetection.net)

特に、[ミンコフスキー差（Minkowski Difference）](https://en.wikipedia.org/wiki/Minkowski_addition)を利用しているため、[凸多面体](https://ja.wikipedia.org/wiki/凸多面体)であることが前提であり、任意の形状を汎用的に扱うためには、予め[凹多面体](https://ja.wikipedia.org/wiki/凹多面体)を凸多面体へ分割する前処理が必要となる。

> ![](https://www.researchgate.net/profile/Khaled_Mamou/publication/221129055/figure/fig3/AS:305611066626072@1449874764261/Fig-4-Segmentation-results-and-generated-convex-hulls.png)  
> \* [A simple and efficient approach for 3D mesh approximate convex decomposition](https://www.researchgate.net/publication/221129055_A_simple_and_efficient_approach_for_3D_mesh_approximate_convex_decomposition)：[ResearchGate](https://www.researchgate.net)

そこで、実装上の煩雑さを避けつつ、任意の大規模モデルを扱うために、ポリゴンモデルを一旦ボクセル化し、ボクセル同士の衝突判定問題へ還元する。もちろんポリゴン同士の接触を厳密に計算していないので、判定精度はボクセルの空間解像度に依存してしまうが、[八分木（Octree）](https://ja.wikipedia.org/wiki/八分木)による階層的な[空間分割](https://en.wikipedia.org/wiki/Space_partitioning)によって検索を効率化できるので、大規模モデルに対しても効率が良い。

> ![](https://upload.wikimedia.org/wikipedia/commons/3/35/Octree2.png)  
> \* [八分木](https://ja.wikipedia.org/wiki/八分木)：[Wikipedia](https://ja.wikipedia.org)

なお、ボクセルモデルは[軸平行](https://en.wikipedia.org/wiki/Axis-aligned_object)に生成されるが、各オブジェクトのローカル座標系に基づいているので、オブジェクトが回転すると、姿勢の異なるボクセル同士の衝突判定が必要となり計算効率が悪くなる。そこで、ボクセル同士の接触を厳密に判定するのではなく、ボクセルに**外接する球体**に対して衝突判定を行う。もちろんボクセルと同様に、球体自体の内包関係も八分木の階層構造を保つので、効率的な検索が可能である。

> ![](https://www.researchgate.net/profile/Costas_Tzafestas/publication/3681383/figure/fig1/AS:279795217780736@1443719786044/Figure-1-Spherical-Object-Centered-Octree-Decompo-sition.png)  
> \* [Real-time collision detection using spherical octrees: virtual reality application](https://www.researchgate.net/publication/3681383_Real-time_collision_detection_using_spherical_octrees_virtual_reality_application)：[ResearchGate](https://www.researchgate.net)
----

[![Delphi Starter](http://img.en25.com/EloquaImages/clients/Embarcadero/%7B063f1eec-64a6-4c19-840f-9b59d407c914%7D_dx-starter-bn159.png)](https://www.embarcadero.com/jp/products/delphi/starter)
