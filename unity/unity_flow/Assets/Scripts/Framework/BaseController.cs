using System;
using System.Collections;
using System.Collections.Generic;
using com.onexr.controllers;
using UnityEngine;

namespace com.onexr.framework
{
    public interface IController
    {
        BaseView View { get; }
        BaseModel Model { get; }
        // Add other common methods or properties if needed
    }

    public class BaseController<V, M> : MonoBehaviour where V : BaseView where M : BaseModel
    {
        public V view;
        public M model;

        public BaseView View => view;
        public BaseModel Model => model;

        void OnEnable()
        {
            Enabled();

            Model.OnDataChangedEvent += View.OnDataChanged;
        }
        public virtual void Enabled() { }

        void OnDisable()
        {
            Disabled();

            Model.OnDataChangedEvent -= View.OnDataChanged;
        }
        public virtual void Disabled() { }

        //public static implicit operator BaseController<V, M>(LoginController v)
        //{
        //    throw new NotImplementedException();
        //}
    }

}