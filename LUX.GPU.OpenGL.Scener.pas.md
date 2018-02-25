# LUX.GPU.OpenGL.Scener;

* TGLObject = **class**( TTreeNode<TGLObject>, IGLObject )
    * プロパティ
        * **property** Scener :TGLScener
        * **property** Pose :TSingleM4
        * **property** RelaPose :TSingleM4
        * **property** AbsoPose :TSingleM4
        * **property** Visible :Boolean
        * **property** HitTest :Boolean
        * **property** Inform :TGLInform
        * **property** BouBox :TSingleArea3D
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** BeginDraw;
        * **procedure** DrawMain;
        * **procedure** EndDraw;
        * **procedure** Draw;
        * **procedure** CalcBouBox;
        * **function** HitBouBox( **const** AbsoRay_:TSingleRay3D; **out** Len_:TSingleArea ) :Boolean;
        * **procedure** HitRay( **const** AbsoRay_:TSingleRay3D; **var** Len_:Single; **var** Obj_:TGLObject );
        * **function** HitRay( **const** AbsoRay_:TSingleRay3D ) :TGLObject;

* TGLScener = **class**( TGLObject, IGLScener )
    * プロパティ
        * **property** RelaPose :TSingleM4
        * **property** AbsoPose :TSingleM4
    * メソッド
        * **constructor** Create;
        * **destructor** Destroy;
        * **procedure** BeginDraw;
        * **procedure** DrawMain;
        * **procedure** EndDraw;
        * **procedure** HitRay( **const** AbsoRay_:TSingleRay3D; **var** Len_:Single; **var** Obj_:TGLObject );
