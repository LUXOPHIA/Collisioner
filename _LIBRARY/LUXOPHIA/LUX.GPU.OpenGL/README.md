# LUX.GPU.OpenGL
[Delphi](https://www.embarcadero.com/jp/products/delphi) で [OpenGL](https://www.wikiwand.com/ja/OpenGL) を扱うためのライブラリ。

![](https://github.com/LUXOPHIA/OpenGL/raw/master/--------/_SCREENSHOT/OpenGL.png)

`TGLView` コンポーネントをフレーム機能を用いて貼ることで、OpenGL の描画領域を GUIパーツ として扱うことができます。OpenGL 実行環境を整えるための `LUX.GPU.OpenGL.FMX|VCL` ユニットと合わせて、[FMX](https://www.wikiwand.com/en/FireMonkey) と [VCL](https://www.wikiwand.com/ja/Visual_Component_Library) 向けにぞれぞれ用意されていますが、その他のユニットは両フレームワーク共に共通です。

* **`FMX/ LUX.GPU.OpenGL.GLView.pas|fmx`**  
**`FMX/ LUX.GPU.OpenGL.FMX.pas`**
    * デモ：[OpenGL](https://github.com/LUXOPHIA/OpenGL)
* **`VCL/ LUX.GPU.OpenGL.GLView.pas|fmx`**  
**`VCL/ LUX.GPU.OpenGL.VCL.pas`**
    * デモ：[OpenGL_VCL](https://github.com/LUXOPHIA/OpenGL_VCL)

----
## ユニット説明

* » ATOM
* FMX
    * [**LUX.GPU.OpenGL.Atom.Imager.Preset**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/FMX/LUX.GPU.OpenGL.Atom.Imager.Preset.pas.md)
    * [**LUX.GPU.OpenGL.Matery.Imager.Preset**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/FMX/LUX.GPU.OpenGL.Matery.Imager.Preset.pas.md)
    * [**LUX.GPU.OpenGL.Viewer**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/FMX/LUX.GPU.OpenGL.Viewer.pas.md)
    * [**LUX.GPU.OpenGL.Window**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/FMX/LUX.GPU.OpenGL.Window.pas.md)
* VCL
    * [**LUX.GPU.OpenGL.Atom.Imager.Preset**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/VCL/LUX.GPU.OpenGL.Atom.Imager.Preset.pas.md)
    * [**LUX.GPU.OpenGL.Matery.Imager.Preset**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/VCL/LUX.GPU.OpenGL.Matery.Imager.Preset.pas.md)
    * [**LUX.GPU.OpenGL.Viewer**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/VCL/LUX.GPU.OpenGL.Viewer.pas.md)
    * [**LUX.GPU.OpenGL.Window**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/VCL/LUX.GPU.OpenGL.Window.pas.md)
* [**LUX.GPU.OpenGL**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.pas.md)
* [**LUX.GPU.OpenGL.Camera**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.Camera.pas.md)
* [**LUX.GPU.OpenGL.Inform**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.Inform.pas.md)
* [**LUX.GPU.OpenGL.Matery**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.Matery.pas.md)
* [**LUX.GPU.OpenGL.Matery.Preset**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.Matery.Preset.pas.md)
* [**LUX.GPU.OpenGL.Scener**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.Scener.pas.md)
* [**LUX.GPU.OpenGL.Shaper.Octree**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.Shaper.Octree.pas.md)
* [**LUX.GPU.OpenGL.Shaper**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.Shaper.pas.md)
* [**LUX.GPU.OpenGL.Shaper.Preset**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.Shaper.Preset.pas.md)
* [**LUX.GPU.OpenGL.Shaper.Voxels**.pas](https://github.com/LUXOPHIA/LUX.GPU.OpenGL/blob/master/LUX.GPU.OpenGL.Shaper.Voxels.pas.md)

----
* [Khronos Combined OpenGL Registry](https://www.khronos.org/registry/OpenGL/)
    * [Khronos OpenGL® Registry](https://khronos.org/registry/OpenGL/index_gl.php)
        * [glcorearb.h](https://khronos.org/registry/OpenGL/api/GL/glcorearb.h)
        * [wglext.h](https://khronos.org/registry/OpenGL/api/GL/wglext.h)
* [The Khronos Group - GitHub](https://github.com/KhronosGroup)
    * [OpenGL-Registry](https://github.com/KhronosGroup/OpenGL-Registry)
        * [api](https://github.com/KhronosGroup/OpenGL-Registry/tree/master/api)
            * [GL](https://github.com/KhronosGroup/OpenGL-Registry/tree/master/api/GL)
                * [glcorearb.h](https://github.com/KhronosGroup/OpenGL-Registry/blob/master/api/GL/glcorearb.h)
                * [wgl.h](https://github.com/KhronosGroup/OpenGL-Registry/blob/master/api/GL/wgl.h)
* [Delphiによる最低限のOpenGL制御](https://tokoik.github.io/opengl/delphi.html)
* [OpenGL with Delphi](http://edn.embarcadero.com/jp/article/26401)
* [neslib/DelphiLearnOpenGL: Learn OpenGL(ES) with Delphi](https://github.com/neslib/DelphiLearnOpenGL)

[![Delphi Starter](http://img.en25.com/EloquaImages/clients/Embarcadero/%7B063f1eec-64a6-4c19-840f-9b59d407c914%7D_dx-starter-bn159.png)](https://www.embarcadero.com/jp/products/delphi/starter)
