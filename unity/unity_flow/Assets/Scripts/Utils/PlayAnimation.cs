using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace com.onexr.app.utils
{
    public class PlayAnimation : MonoBehaviour
    {
        private Animation anim;

        // Start is called before the first frame update
        void Start()
        {
            anim = gameObject.GetComponentInChildren<Animation>();
            anim.wrapMode = WrapMode.Loop;
            anim.Play();
        }
    

        // Update is called once per frame
        void Update()
        {

        }
    }
}
