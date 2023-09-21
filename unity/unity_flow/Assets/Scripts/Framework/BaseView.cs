using System.Collections;
using System.Collections.Generic;
using com.onexr.models;
using UnityEngine;

namespace com.onexr.framework
{
    public abstract class BaseView
    {
        public abstract void OnDataChanged(BaseModel model);
    }
}
