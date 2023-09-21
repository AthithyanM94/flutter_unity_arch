using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using com.onexr.framework;
using com.onexr.models;
using com.onexr.app.utils;
using System.Linq;

namespace com.onexr.views
{
    [System.Serializable]
    public class WorkflowView : BaseView
    {
        private static string TAG = "WorkflowView";
        public Button homeButton;
        public Button playAnimButon;
        public TMP_Text statusText;

        public CineMachineTransition cineMachineTransition;
        public WorkflowAnimator workflowAnimator;
        public Transform[] targetSpots;
        public GameObject[] intutiveSpots;
        public TouchSense touchSense;
        private int currentIndex;

        public override void OnDataChanged(BaseModel model)
        {
            Debug.Log(((WorkflowModel)model).animName);
            Debug.Log(((WorkflowModel)model).playStatus);

            currentIndex = ((WorkflowModel)model).GetAnimationIndex();
            cineMachineTransition.LookAtObject(targetSpots[currentIndex]);
            intutiveSpots.ToList().ForEach(obj => obj.SetActive(false));

            if (currentIndex != 0)
                workflowAnimator.TransitionState(((WorkflowModel)model).GetAnimationIndex());
        }

        public void OnAnimationComplete()
        {
            Debug.Log(TAG + ": OnAnimationComplete");
            intutiveSpots[currentIndex].SetActive(true);
        }
    }
}
