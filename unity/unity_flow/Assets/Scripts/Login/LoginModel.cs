using System.Collections;
using System.Collections.Generic;
using com.onexr.framework;
using UnityEngine;

namespace com.onexr.models
{
    [System.Serializable]
    public class LoginModel : BaseModel
    {
        public string username;
        public string password;
        public bool saveInfo;

        public void Authenticate()
        {
            Callback();
        }
    }
}
