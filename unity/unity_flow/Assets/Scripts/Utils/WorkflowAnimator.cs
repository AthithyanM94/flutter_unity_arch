using UnityEngine;

namespace com.onexr.app.utils
{
    public class WorkflowAnimator : MonoBehaviour
    {
        private static string TAG = "WorkflowAnimator";
        private Animator thisAnim;
        private bool animCompleteEventTriggered;
        public event System.Action OnAnimationCompleteEvent;

        private void Start()
        {
            Debug.Log(TAG + " : Start()");
            thisAnim = GetComponent<Animator>();
        }

        public Animator GetAnimator()
        {
            return thisAnim;
        }

        public void TransitionState(int index)
        {
            thisAnim.SetInteger("AnimationIndex", index);
            Invoke("LateCall", 0.5f);
        }

        private void Update()
        {
            //Debug.Log(thisAnim.GetCurrentAnimatorStateInfo(0).length);
            //Debug.Log(thisAnim.GetCurrentAnimatorStateInfo(0).normalizedTime);
            if (thisAnim.GetCurrentAnimatorStateInfo(0).normalizedTime > 1f
                   && !animCompleteEventTriggered)
            {
                Debug.Log(TAG + " : animation complete");
                animCompleteEventTriggered = true;
                OnAnimationCompleteEvent();
            }
        }

        private void LateCall()
        {
            Debug.Log("LateCall");
            animCompleteEventTriggered = false;

        }
    }
}