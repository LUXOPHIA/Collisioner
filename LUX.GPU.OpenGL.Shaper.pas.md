# LUX.GPU.OpenGL.Shaper;

* TGLShaper = **class**( TGLObject, IGLShaper )
    * プロパティ
        * **property** Matery :IGLMatery
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** BeginDraw;
        * **procedure** EndDraw;

* TGLShaperPoin = **class**( TGLShaper )
    * プロパティ
        * **property** PosBuf :TGLVerterS<TSingle3D>
        * **property** NorBuf :TGLVerterS<TSingle3D>
        * **property** TexBuf :TGLVerterS<TSingle2D>
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** BeginDraw;
        * **procedure** DrawMain;
        * **procedure** EndDraw;
        * **procedure** CalcBouBox;
        * **procedure** LoadFromFunc( **const** Func_:TConstFunc<TdSingle2D,TdSingle3D>; **const** DivU_,DivV_:Integer );
        * **procedure** LoadFromFileSTL( **const** FileName_:String );
        * **procedure** LoadFromFileOBJ( **const** FileName_:String );

* TGLShaperLine = **class**( TGLShaperPoin )
    * プロパティ
        * **property** EleBuf :TGLElemerLine32
        * **property** LineW :Single
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** BeginDraw;
        * **procedure** DrawMain;
        * **procedure** EndDraw;
        * **procedure** LoadFromFunc( **const** Func_:TConstFunc<TdSingle2D,TdSingle3D>; **const** DivU_,DivV_:Integer );
        * **procedure** LoadFromFileSTL( **const** FileName_:String );
        * **procedure** LoadFromFileOBJ( **const** FileName_:String );

* TGLShaperFace = **class**( TGLShaperPoin )
    * プロパティ
        * **property** EleBuf :TGLElemerFace32
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** DrawMain;
        * **procedure** LoadFromFunc( **const** Func_:TConstFunc<TdSingle2D,TdSingle3D>; **const** DivU_,DivV_:Integer );
        * **procedure** LoadFromFileSTL( **const** FileName_:String );
        * **procedure** LoadFromFileOBJ( **const** FileName_:String );
