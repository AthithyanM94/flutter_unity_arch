using System.Collections;
using System.Collections.Generic;
using com.onexr.framework;
using UnityEngine;

namespace com.onexr.models
{
    [System.Serializable]
    public class WorkflowModel : BaseModel
    {
        public string animName;
        public bool playStatus;

        private int currentIndex = 0;

        public void Play()
        {
            //TODO: This needs to be dynamic
            if (currentIndex >= 7)
                currentIndex = 0;

            currentIndex = currentIndex + 1;
            Callback();
        }

        public void Home()
        {
            Callback();
        }

        public int GetAnimationIndex()
        {
            return currentIndex;
        }
    }
}
