using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraTransition : MonoBehaviour
{
    public Transform[] points;
    public int currentPointIndex = 0;
    public Transform lookAtTarget;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            StartCoroutine(MakeTransition(points[currentPointIndex], 1.0f));
            currentPointIndex++;
        }
    }

    IEnumerator MakeTransition(Transform nextPoint, float time)
    {
        float i = 0;
        float rate = 1 / time;

        Vector3 fromPos = transform.position;

        while (i < 1)
        {
            i += Time.deltaTime * rate;
            transform.position = Vector3.Lerp(fromPos, nextPoint.position, i);

            Debug.Log(nextPoint.rotation.eulerAngles.x + "," + nextPoint.rotation.eulerAngles.y + ", " + nextPoint.rotation.eulerAngles.z);
            //Quaternion targetRotation = Quaternion.LookRotation(nextPoint.position - transform.position);
            transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.Euler(new Vector3(nextPoint.rotation.eulerAngles.x, nextPoint.rotation.eulerAngles.y, nextPoint.rotation.eulerAngles.z)), i);

            yield return 0;
        }
    }
}

