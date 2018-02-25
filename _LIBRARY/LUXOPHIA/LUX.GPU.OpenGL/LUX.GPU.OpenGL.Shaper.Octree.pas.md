# LUX.GPU.OpenGL.Shaper.Octree;

* TGLShaperOctree = **class**( TGLShaperFace )
    * プロパティ
        * **property** Size :Single
        * **property** Cent :TSingle3D
        * **property** Reso :Single
        * **property** Tree :TOctree3D
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Generate;
        * **procedure** MakeGrid;
        * **function** Collision( **const** Shaper_:TGLShaperOctree ) :Boolean;
