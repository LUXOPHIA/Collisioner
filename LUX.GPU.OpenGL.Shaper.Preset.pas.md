# LUX.GPU.OpenGL.Shaper.Preset;

* TGLShaperCopy = **class**( TGLShaper )
    * プロパティ
        * **property** Shaper :TGLShaperPoin
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** BeginDraw;
        * **procedure** DrawMain;
        * **procedure** EndDraw;
        * **procedure** CalcBouBox;

* TGLShaperLineCube = **class**( TGLShaperLine )
    * プロパティ
        * **property** SizeX :Single
        * **property** SizeY :Single
        * **property** SizeZ :Single
        * **property** Color :TAlphaColorF
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;

* TGLDotCube = **class**( TGLShaperPoin )
    * プロパティ
        * **property** SizeX :Single
        * **property** SizeY :Single
        * **property** SizeZ :Single
        * **property** DivNX :Integer
        * **property** DivNY :Integer
        * **property** DivNZ :Integer
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
