using System.Collections;
using System.Collections.Generic;
using com.onexr.framework;
using com.onexr.models;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace com.onexr.views
{
    [System.Serializable]
    public class LoginView : BaseView
    {
        public TMP_InputField usernameInput;
        public TMP_InputField passwordInput;
        public Toggle saveInfoToggle;
        public Button loginButton;

        public override void OnDataChanged(BaseModel model)
        {
            Debug.Log(((LoginModel)model).username);
        }
    }
}
