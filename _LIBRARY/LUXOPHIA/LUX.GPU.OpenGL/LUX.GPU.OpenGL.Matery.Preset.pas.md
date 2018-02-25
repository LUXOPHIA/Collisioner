# LUX.GPU.OpenGL.Matery.Preset;

* TGLMateryColor = **class**( TGLMatery, IGLMateryColor )
    * プロパティ
        * **property** Color :TAlphaColorF
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;

* TGLMateryRGB = **class**( TGLMateryNor, IGLMateryRGB )
    * プロパティ
        * **property** Ambient :TAlphaColorF
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;

* TGLMateryDiffuse = **class**( TGLMateryNor, IGLMateryDiffuse )
    * プロパティ
        * **property** Ambient :TAlphaColorF
        * **property** Diffuse :TAlphaColorF
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;

* TGLMateryPlastic = **class**( TGLMateryImag, IGLMateryPlastic )
    * プロパティ
        * **property** Ambient :TAlphaColorF
        * **property** Diffuse :TAlphaColorF
        * **property** RefI :Single
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;

* TGLMateryMirror = **class**( TGLMateryImag, IGLMateryMirror )
    * プロパティ
        * **property** Color :TAlphaColorF
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;

* TGLMateryGlass = **class**( TGLMateryImag, IGLMateryGlass )
    * プロパティ
        * **property** RefI :Single
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** Use;
        * **procedure** Unuse;
