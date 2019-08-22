// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

// Simplified VertexLit Blended Particle shader. Differences from regular VertexLit Blended Particle one:
// - no AlphaTest
// - no ColorMask

Shader "Effect/Distortion/Mobile/VertexLit Blended" {
Properties {
    _EmisColor ("Emissive Color", Color) = (.2,.2,.2,0)
    _MainTex ("Particle Texture", 2D) = "white" {}
	_DistortColor("Distort Color", Color) = (0,1,0,1)
}

Category {
    Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Distortion" "PreviewType"="Plane" "RenderType" = "Distortion" }
    Blend SrcAlpha OneMinusSrcAlpha
    Cull Off ZWrite Off Fog { Color (0,0,0,0) }

    Lighting On
    Material { Emission [_EmisColor] }
    ColorMaterial AmbientAndDiffuse

    SubShader {
        Pass {
            SetTexture [_MainTex] {
                combine texture * primary
            }
        }
    }
}
}
