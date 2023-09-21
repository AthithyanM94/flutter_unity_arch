using System.Collections;
using System.Collections.Generic;
using Cinemachine;
using UnityEngine;

public class CineMachineTransition : MonoBehaviour
{
    [SerializeField]
    private CinemachineVirtualCamera cam;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void LookAtObject(Transform target)
    {
        cam.m_Follow = target;
    }
}
