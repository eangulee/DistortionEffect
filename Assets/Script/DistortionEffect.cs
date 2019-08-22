using System;
using UnityEngine;
using System.Collections;

public class DistortionEffect : MonoBehaviour
{
    /// <summary>
    /// 扭曲对应的材质球
    /// </summary>
    public Material _DistortMat;
    /// <summary>
    /// 特定渲染图
    /// </summary>
    private RenderTexture m_R;

    /// <summary>
    /// mask摄像机
    /// </summary>
    public Camera maskRenderCamera;

    /// <summary>
    /// 替换shader
    /// </summary>
    public Shader replaceShader;

    private void Awake()
    {
#if UNITY_EDITOR
        m_R = RenderTexture.GetTemporary(Screen.width / 2, Screen.height / 2, 0, RenderTextureFormat.ARGB32);
#else
        m_R = RenderTexture.GetTemporary(Screen.width / 2, Screen.height / 2, 0, RenderTextureFormat.ARGB32);
#endif
        maskRenderCamera.enabled = false;
        maskRenderCamera.clearFlags = CameraClearFlags.SolidColor;
        maskRenderCamera.backgroundColor = Color.black;
        maskRenderCamera.targetTexture = m_R;
    }

    /// <summary>
    /// 处理mask图
    /// </summary>
    private void OnPreRender()
    {
        maskRenderCamera.RenderWithShader(replaceShader, "RenderType");
    }

    /// <summary>
    /// 后处理
    /// </summary>
    /// <param name="source"></param>
    /// <param name="destination"></param>
    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        _DistortMat.SetTexture("_MaskTex", m_R);
        Graphics.Blit(source, destination, _DistortMat);
    }
}


