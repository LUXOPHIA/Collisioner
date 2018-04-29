# LUX.GPU.OpenGL.Matery.Imager.Preset

* TGLMateryImag = **class**( TGLMateryNorTex, IGLMateryImag )
    * プロパティ
        * **property** Sample :TGLSample
        * **property** Imager :TGLImager2D_RGBA
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;

* TGLMateryImagG = **class**( TGLMateryNorTexG, IGLMateryImag )
    * プロパティ
        * **property** Sample :TGLSample
        * **property** Imager :TGLImager2D_RGBA
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;

* TGLMateryBB = **class**( TGLMateryImag )
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;
