# LUX.GPU.OpenGL.Viewer

* TGLViewer = **class**(TFrame)
    * プロパティ
        * **property** DC :HDC
        * **property** Camera :TGLCamera
    * イベント
        * **property** OnPaint :TProc
    * メソッド
        * **constructor** Create( AOwner_:TComponent );
        * **destructor** Destroy;
        * **procedure** RecreateDC;
        * **procedure** BeginGL;
        * **procedure** EndGL;
        * **procedure** BeginRender;
        * **procedure** EndRender;
        * **function** MakeScreenShot :Vcl.Graphics.TBitmap;
        * **function** ShootRay( **const** X_,Y_:Single ) :TSingleRay3D;
        * **function** PickObject( **const** X_,Y_:Single ) :TGLObject;
