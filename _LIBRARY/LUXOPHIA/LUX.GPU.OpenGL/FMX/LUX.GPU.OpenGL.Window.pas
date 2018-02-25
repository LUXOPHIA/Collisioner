unit LUX.GPU.OpenGL.Window;

interface //#################################################################### ■

uses System.Classes,
     FMX.Types,
     Winapi.Windows,
     LUX, LUX.FMX.Forms, LUX.GPU.OpenGL;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {RECORD}

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     TGLViewerForm = class( TCommonCustomForm )
     private
     protected
       _WND :HWND;
       _DC  :HDC;
       ///// アクセス
       function GetParentWind :HWND;
       ///// メソッド
       procedure CreateHandle; override;
       procedure DestroyHandle; override;
       procedure DoParentFormChanged; override;
       procedure CreateDC;
       procedure DestroyDC;
     public
       constructor CreateNew( Owner_:TComponent; Dummy_:NativeInt = 0 ); override;
       destructor Destroy; override;
       ///// プロパティ
       property ParentWind :HWND read GetParentWind;
       property WND        :HWND read   _WND       ;
       property DC         :HDC  read   _DC        ;
       ///// メソッド
       procedure BeginGL;
       procedure EndGL;
       procedure SwapBuffers;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOepnGL

     TOepnGL_FMX = class( TOpenGL )
     private
       _Form :LUX.FMX.Forms.TCommonCustomForm;
     protected
       procedure CreateWindow; override;
       procedure DestroyWindow; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses FMX.Controls, FMX.Forms, FMX.Platform.Win,
     Winapi.OpenGLext;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOepnGL

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLViewerForm.GetParentWind :HWND;
begin
     Result := WindowHandleToPlatform( ParentForm.Handle ).Wnd;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLViewerForm.CreateHandle;
begin
     inherited;

     _WND := WindowHandleToPlatform( Handle ).Wnd;

     SetWindowLong( _WND, GWL_STYLE, WS_CHILD or WS_CLIPSIBLINGS );

     CreateDC;
end;

procedure TGLViewerForm.DestroyHandle;
begin
     DestroyDC;

     inherited;
end;

procedure TGLViewerForm.DoParentFormChanged;
begin
     inherited;

     if Assigned( Parent ) and ( Parent is TControl ) then Visible := ( Parent as TControl ).ParentedVisible;

     if Assigned( ParentForm ) then Assert( Winapi.Windows.SetParent( _WND, ParentWind ) > 0, 'Failed! TGLViewerForm.CreateHandle' );
end;

//------------------------------------------------------------------------------

procedure TGLViewerForm.CreateDC;
begin
     _DC := GetDC( _WND );

     Assert( _DC > 0, 'Failed! TGLViewerForm.CreateDC' );

     _OpenGL_.ApplyPixelFormat( _DC );
end;

procedure TGLViewerForm.DestroyDC;
begin
     ReleaseDC( _WND, _DC );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLViewerForm.CreateNew( Owner_:TComponent; Dummy_:NativeInt = 0 );
begin
     inherited;

     BorderStyle := TFmxFormBorderStyle.None;

     Show; Hide;
end;

destructor TGLViewerForm.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLViewerForm.BeginGL;
begin
     _OpenGL_.EndGL;

       Assert( wglMakeCurrent( _DC, _OpenGL_.RC ), 'Failed! TGLViewerForm.BeginGL' );
end;

procedure TGLViewerForm.EndGL;
begin
       Assert( wglMakeCurrent( _DC, 0 ), 'Failed! TGLViewerForm.EndGL' );

     _OpenGL_.BeginGL;
end;

//------------------------------------------------------------------------------

procedure TGLViewerForm.SwapBuffers;
begin
     Winapi.Windows.SwapBuffers( _DC );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOepnGL

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TOepnGL_FMX.CreateWindow;
begin
     _Form := LUX.FMX.Forms.TCommonCustomForm.CreateNew( nil );

     _WND := WindowHandleToPlatform( _Form.Handle ).Wnd;
end;

procedure TOepnGL_FMX.DestroyWindow;
begin
     _Form.DisposeOf;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

     _OpenGL_ := TOepnGL_FMX.Create;

     InitOpenGLext;

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
