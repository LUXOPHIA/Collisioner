# LUX.GPU.OpenGL
OpenGL を扱うためのライブラリ。

![](https://github.com/LUXOPHIA/OpenGL/raw/master/--------/_SCREENSHOT/OpenGL-View.png)

FMX と VCL 向けに用意された `TGLView` コンポーネントを、フレーム機能を用いて貼ることで、OpenGL の描画領域を GUIパーツ として扱うことができます。

* `FMX/LUX.GPU.OpenGL.GLView.pas|fmx`
    * [OpenGL](https://github.com/LUXOPHIA/OpenGL)
* `VCL/LUX.GPU.OpenGL.GLView.pas|fmx`
    * [OpenGL_VCL](https://github.com/LUXOPHIA/OpenGL_VCL)

初期化さえ済んでしまえば、OpenGL の API は両フレームワーク共に共通に利用できます。

----
* [Khronos Combined OpenGL Registry](https://www.khronos.org/registry/OpenGL/)
    * [Khronos OpenGL® Registry](https://khronos.org/registry/OpenGL/index_gl.php)
        * [glcorearb.h](https://khronos.org/registry/OpenGL/api/GL/glcorearb.h)
        * [wglext.h](https://khronos.org/registry/OpenGL/api/GL/wglext.h)
* [The Khronos Group - GitHub](https://github.com/KhronosGroup)
    * [OpenGL-Registry](https://github.com/KhronosGroup/OpenGL-Registry)
        * [api](https://github.com/KhronosGroup/OpenGL-Registry/tree/master/api)
            * [GL]()
                * [glcorearb.h](https://github.com/KhronosGroup/OpenGL-Registry/blob/master/api/GL/glcorearb.h)
                * [wgl.h](https://github.com/KhronosGroup/OpenGL-Registry/blob/master/api/GL/wgl.h)
* [Delphiによる最低限のOpenGL制御](https://tokoik.github.io/opengl/delphi.html)
* [OpenGL with Delphi](http://edn.embarcadero.com/jp/article/26401)
* [neslib/DelphiLearnOpenGL: Learn OpenGL(ES) with Delphi](https://github.com/neslib/DelphiLearnOpenGL)

[![Delphi Starter](http://img.en25.com/EloquaImages/clients/Embarcadero/%7B063f1eec-64a6-4c19-840f-9b59d407c914%7D_dx-starter-bn159.png)](https://www.embarcadero.com/jp/products/delphi/starter)
