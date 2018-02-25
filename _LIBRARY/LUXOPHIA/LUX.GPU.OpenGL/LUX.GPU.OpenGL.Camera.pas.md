# LUX.GPU.OpenGL.Camera;

* TGLCamera = **class**( TGLObject, IGLCamera )
    * プロパティ
        * **property** Proj :TSingleM4
        * **property** Offs :TSingle2D
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** HitRay( **const** AbsoRay_:TSingleRay3D; **var** Len_:Single; **var** Obj_:TGLObject );
        * **procedure** Render;

* TGLCameraOrth = **class**( TGLCamera )
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** CalcProj;
    * プロパティ
        * **property** Size :Single

* TGLCameraPers = **class**( TGLCamera )
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** CalcProj;
    * プロパティ
        * **property** Angl :Single
