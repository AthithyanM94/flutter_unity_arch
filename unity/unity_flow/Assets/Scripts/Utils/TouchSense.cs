using System.Collections;
using System.Collections.Generic;
using com.onexr.framework;
using UnityEngine;

public class TouchSense : MonoBehaviour
{
    private static string TAG = "TouchSense";
    public event System.Action<string> OnObjectTouchEvent;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

        if (Application.isEditor)
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit, 1000) && Input.GetMouseButtonDown(0))
            {
                Debug.Log(TAG + ", touch sensed editor");
                DetectTouch(hit);
            }
        }
        else
        {
            if (Input.touchCount > 0 && Input.touches[0].phase == TouchPhase.Began)
            {
                Ray ray = Camera.main.ScreenPointToRay(Input.touches[0].position);
                RaycastHit hit;
                if (Physics.Raycast(ray, out hit))
                {
                    Debug.Log(TAG + ", touch sensed mobile");
                    DetectTouch(hit);
                }
            }
        }
    }

    void DetectTouch(RaycastHit hit)
    {
        if (hit.transform.name.Contains("Spot_") || hit.transform.name.Contains("Default"))
        {
            Debug.Log(TAG + ", touch sensed on " + hit.transform.name);
            OnObjectTouchEvent(hit.transform.name);
        }
    }
}
