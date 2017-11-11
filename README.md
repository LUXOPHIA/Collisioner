# Collisioner
任意のポリゴンモデル同士の衝突判定を、オクトツリーの空間分割で高速化する方法。

[**[YouTube]**](https://youtu.be/Z5qbxQI6dgw) [**[Vimeo]**](https://vimeo.com/242276066)  
[![](https://media.githubusercontent.com/media/LUXOPHIA/Collisioner/movie/--------/_MOVIE/Collisioner_640x360.gif)](https://youtu.be/Z5qbxQI6dgw)

ゲームレベルで利用されるローポリゴン同士の衝突であれば、[ミンコフスキー差（Minkowski Difference）](https://en.wikipedia.org/wiki/Minkowski_addition)を利用した [GJK：Gilbert-Johnson-Keerthi distance algorithm](https://en.wikipedia.org/wiki/Gilbert–Johnson–Keerthi_distance_algorithm) を用いることで高速に判定可能であるが、CADレベルで利用される大規模ポリゴンモデルに対しては非常に効率が悪い。

> \* [A fast procedure for computing the distance between complex objects in three-dimensional space](https://graphics.stanford.edu/courses/cs448b-00-winter/papers/gilbert.pdf)

> [**[SlidePlayer]**](http://slideplayer.com)  
> [![](http://slideplayer.com/slide/689954/2/images/26/Minkowski+sum+&+difference.jpg)](http://slideplayer.com/slide/689954/)  
> \* [Ericson:the GJK algorithm - Real-Time Collision Detection](http://realtimecollisiondetection.net/pubs/SIGGRAPH04_Ericson_the_GJK_algorithm.ppt)：[realtimecollisiondetection.net](http://realtimecollisiondetection.net)

そこで、ポリゴンモデルを一旦ボクセル化し、ボクセル同士の衝突判定に還元する。もちろんポリゴン同士の接触を厳密に計算していないので、判定精度はボクセルの空間解像度に依存してしまうが、[Octree：八分木](https://ja.wikipedia.org/wiki/八分木)による階層的な[空間分割](https://en.wikipedia.org/wiki/Space_partitioning)によって検索を効率化できるので、大規模なポリゴンモデルを扱うことが容易になる。

> ![](https://upload.wikimedia.org/wikipedia/commons/3/35/Octree2.png)  
> \* [八分木](https://ja.wikipedia.org/wiki/八分木)：[Wikipedia](https://ja.wikipedia.org)

なお、ボクセルモデルは[軸平行](https://en.wikipedia.org/wiki/Axis-aligned_object)に生成されるが、各オブジェクトのローカル座標系に基づいているので、オブジェクトが回転すると、任意の姿勢のボクセル同士の衝突判定が必要となり非効率となる。そこで、ボクセル同士の接触を厳密に判定するのではなく、ボクセルに**外接する球体**に対して衝突判定を行う。もちろんボクセルと同様に、球体自体も八分木の階層構造を保つので、高速な検索が可能である。

> ![](https://www.researchgate.net/profile/Costas_Tzafestas/publication/3681383/figure/fig1/AS:279795217780736@1443719786044/Figure-1-Spherical-Object-Centered-Octree-Decompo-sition.png)  
> \* [Real-time collision detection using spherical octrees: virtual reality application](https://www.researchgate.net/publication/3681383_Real-time_collision_detection_using_spherical_octrees_virtual_reality_application)：[ResearchGate](https://www.researchgate.net)
----

[![Delphi Starter](http://img.en25.com/EloquaImages/clients/Embarcadero/%7B063f1eec-64a6-4c19-840f-9b59d407c914%7D_dx-starter-bn159.png)](https://www.embarcadero.com/jp/products/delphi/starter)
