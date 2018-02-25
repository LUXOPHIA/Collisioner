# LUX.GPU.OpenGL.Matery;

* TGLMatery = **class**( TInterfacedObject, IGLMatery )
    * プロパティ
        * **property** Engine :TGLEngine
        * **property** ShaderV :TGLShaderV
        * **property** ShaderF :TGLShaderF
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;

* TGLMateryNor = **class**( TGLMatery, IGLMateryNor )
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;

* TGLMateryNorTex = **class**( TGLMateryNor, IGLMateryNorTex )
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;

* TGLMateryG = **class**( TGLMatery, IGLMateryG )
    * プロパティ
        * **property** ShaderG :TGLShaderG
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;

* TGLMateryNorTexG = **class**( TGLMateryNorTex, IGLMateryNorTexG )
    * プロパティ
        * **property** ShaderG :TGLShaderG
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
