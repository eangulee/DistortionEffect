// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

// Simplified Multiply Particle shader. Differences from regular Multiply Particle one:
// - no Smooth particle support
// - no AlphaTest
// - no ColorMask

Shader "Effect/Distortion/Mobile/Multiply" {
Properties {
    _MainTex ("Particle Texture", 2D) = "white" {}
	_DistortColor("Distort Color", Color) = (0,1,0,1)
}

Category {
    Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Distortion" "PreviewType"="Plane" "RenderType" = "Distortion" }
    Blend Zero SrcColor
    Cull Off Lighting Off ZWrite Off Fog { Color (1,1,1,1) }

    BindChannels {
        Bind "Color", color
        Bind "Vertex", vertex
        Bind "TexCoord", texcoord
    }

    SubShader {
        Pass {
            SetTexture [_MainTex] {
                combine texture * primary
            }
            SetTexture [_MainTex] {
                constantColor (1,1,1,1)
                combine previous lerp (previous) constant
            }
        }
    }
}
}
