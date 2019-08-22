Shader "Hidden/ImageEffect Replace" 
{

	//替换标签是Distortion的shader
	SubShader
	{
		Tags{ "RenderType" = "Distortion" "Queue" = "Transparent" }
		Blend SrcAlpha One
		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			#pragma fragmentoption ARB_precision_hint_fastest
			#include "UnityCG.cginc"

			uniform sampler2D _MainTex;
			uniform float4 _DistortColor;
			half4 frag(v2f_img i) : COLOR
			{
				half4 c = tex2D(_MainTex,i.uv);
				c.x = _DistortColor.r;
				c.y = _DistortColor.g;
				c.z = _DistortColor.b;
				return c;
			}
			ENDCG
		}
	}
    
	//替换标签是Opaque的shader，这里直接渲染为黑色
    SubShader 
	{
        Tags { "RenderType" = "Opaque" }
        Pass 
		{    
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            #pragma fragmentoption ARB_precision_hint_fastest
            #include "UnityCG.cginc"
            half4 frag(v2f_img i) : COLOR
            {
                return half4(0,0,0,1);
            }
            ENDCG
        }
    }   
	Fallback Off
}
