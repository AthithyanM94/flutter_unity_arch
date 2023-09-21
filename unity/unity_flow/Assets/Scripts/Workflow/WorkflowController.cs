using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;
using com.onexr.app.utils;
using com.onexr.framework;
using com.onexr.models;
using com.onexr.views;
using FlutterUnityIntegration;
using UnityEngine;

namespace com.onexr.controllers
{
    public class WorkflowController : BaseController<WorkflowView, WorkflowModel>
    {
        static private string TAG = "WorkflowController";
        private bool animCompleteTriggered = false;

        public override void Disabled()
        {
            view.homeButton.onClick.RemoveAllListeners();
            view.playAnimButon.onClick.RemoveAllListeners();
            view.touchSense.OnObjectTouchEvent -= ObjectTouchSensed;
            view.workflowAnimator.OnAnimationCompleteEvent -= OnAnimationCompleteListener;
        }

        public override void Enabled()
        {
            view.homeButton.onClick.AddListener(HomeButtonPressed);
            view.playAnimButon.onClick.AddListener(PlayAnimButtonPressed);
            view.touchSense.OnObjectTouchEvent += ObjectTouchSensed;
            view.workflowAnimator.OnAnimationCompleteEvent += OnAnimationCompleteListener;

        }

        private void Start()
        {
            model.Home();
            gameObject.AddComponent<UnityMessageManager>();
        }

        #region User actions
        void HomeButtonPressed()
        {

        }

        void PlayAnimButtonPressed()
        {

        }

        void OnAnimationCompleteListener()
        {
            UnityMessageManager.Instance.SendMessageToFlutter("animation_complete_idx_" + model.GetAnimationIndex().ToString());
        }

        void ObjectTouchSensed(string objectName)
        {
            model.Play();
            Invoke("setTriggerLate", 100);
            animCompleteTriggered = false;
            //view.OnTouchEventListener(objectName);
        }


        #endregion

        #region Flutter Callbacks

        public void OnWorkflowActionComplete(string message)
        {
            Debug.Log(TAG + " call received form flutter with message : " + message);
            view.OnAnimationComplete();
        }

        #endregion
    }
}