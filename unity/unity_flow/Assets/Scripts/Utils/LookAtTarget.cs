using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace com.onexr.app.utils
{
    public class LookAtTarget : MonoBehaviour
    {
        [SerializeField]
        private Camera targetCamera;
        // Update is called once per frame
        void LateUpdate()
        {
            gameObject.transform.LookAt(gameObject.transform.position + targetCamera.transform.forward);

        }
    }
}
