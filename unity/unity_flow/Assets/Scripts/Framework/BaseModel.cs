using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace com.onexr.framework
{
    public class BaseModel
    {
        public event System.Action<BaseModel> OnDataChangedEvent;

        public void Callback()
        {
            OnDataChangedEvent(this);
        }
    }
}
